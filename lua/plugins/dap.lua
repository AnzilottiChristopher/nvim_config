-- lua/plugins/dap.lua
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio", -- required by nvim-dap-ui
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Breakpoint signs
            vim.fn.sign_define("DapBreakpoint",
                { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition",
                { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped",
                { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

            vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
            vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#f5a623" })
            vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
            vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e4d3d" })

            -- Re-apply highlights after colorscheme changes
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
                    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#f5a623" })
                    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
                    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e4d3d" })
                end,
            })

            -- Setup DAP UI
            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.35 },
                            { id = "breakpoints", size = 0.15 },
                            { id = "stacks",      size = 0.35 },
                            { id = "watches",     size = 0.15 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "repl",    size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            })

            -- Auto open/close DAP UI when debugging starts/ends
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Configure codelldb for Rust
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.rust = {
                {
                    name = "Launch binary",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        local cwd = vim.fn.getcwd()
                        local project_name = vim.fn.fnamemodify(cwd, ":t")
                        local binary = cwd .. "/target/debug/" .. project_name
                        if vim.fn.executable(binary) == 1 then
                            return binary
                        end
                        return vim.fn.input("Path to binary: ", cwd .. "/target/debug/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Debug: Conditional Breakpoint" })
            vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
            vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
            vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Debug: Terminate" })
        end,
    },
}
