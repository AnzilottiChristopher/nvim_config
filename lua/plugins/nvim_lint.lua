return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        -- register sea as a custom linter
        lint.linters.sea = {
            cmd = "sea",
            stdin = false,
            args = {},
            stream = "stdout",
            ignore_exitcode = true,
            parser = require("lint.parser").from_pattern(
            -- handle Windows paths with drive letters like C:\...
                "(.+):(%d+):(%d+): (%w+): (.+)",
                { "file", "lnum", "col", "severity", "message" },
                {
                    ["error"]   = vim.diagnostic.severity.ERROR,
                    ["warning"] = vim.diagnostic.severity.WARN,
                }
            )
        }

        -- run sea on C files
        lint.linters_by_ft = {
            c = { "sea" }
        }

        -- run on save
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end
        })
    end
}
