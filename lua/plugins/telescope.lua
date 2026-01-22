return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Faster sorting
        'nvim-tree/nvim-web-devicons',                                  -- File icons
    },
    cmd = "Telescope",
    keys = {
        -- File finding
        { "<leader>ff", "<cmd>Telescope find_files<cr>",             desc = "Find Files" },
        { "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files (including hidden)" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",              desc = "Find Text" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",                desc = "Find Buffers" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",               desc = "Recent Files" },

        -- Search/Help
        { "<leader>fH", "<cmd>Telescope help_tags<cr>",              desc = "Help Tags" },
        { "<leader>fc", "<cmd>Telescope commands<cr>",               desc = "Commands" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>",                desc = "Keymaps" },
        { "<leader>fs", "<cmd>Telescope grep_string<cr>",            desc = "Find String Under Cursor" },

        -- Git (if you use git)
        { "<leader>gc", "<cmd>Telescope git_commits<cr>",            desc = "Git Commits" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>",             desc = "Git Status" },

        -- LSP (if you use LSP)
        { "<leader>ld", "<cmd>Telescope diagnostics<cr>",            desc = "Diagnostics" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",   desc = "Document Symbols" },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        -- Custom action to toggle hidden files
        local toggle_hidden = function(prompt_bufnr)
            local picker = action_state.get_current_picker(prompt_bufnr)
            local finder = picker.finder

            -- Toggle hidden flag
            finder.hidden = not finder.hidden

            -- Refresh the picker
            picker:refresh(require('telescope.finders').new_oneshot_job(
                vim.tbl_flatten({
                    "rg", "--files", "--color", "never",
                    finder.hidden and "--hidden" or "",
                    "--glob", "!**/.git/*"
                })
            ))
        end

        telescope.setup({
            defaults = {
                -- Appearance
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "truncate" },

                -- Layout
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },

                -- File/folder filtering
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    "dist/",
                    "build/",
                    "target/",
                    "%.lock",
                },

                -- Behavior
                sorting_strategy = "ascending",

                -- Keymaps inside Telescope
                mappings = {
                    i = { -- Insert mode
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<C-h>"] = toggle_hidden, -- Toggle hidden files with Ctrl+h
                        ["<Esc>"] = actions.close,
                    },
                    n = {                      -- Normal mode
                        ["q"] = actions.close,
                        ["H"] = toggle_hidden, -- Toggle hidden files with Shift+h in normal mode
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = false, -- Don't show hidden files by default
                    find_command = { "rg", "--files", "--color", "never", "--glob", "!**/.git/*" },
                },
                live_grep = {
                    -- Don't search hidden files by default
                },
                buffers = {
                    sort_mru = true, -- Sort by most recently used
                    mappings = {
                        i = {
                            ["<C-d>"] = actions.delete_buffer, -- Delete buffer with Ctrl+d
                        },
                    },
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        -- Load extensions
        telescope.load_extension('fzf')
    end,
}
