return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        -- register lighthouse as a custom linter
        lint.linters.lighthouse = {
            cmd = "lighthouse",
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

        -- run lighthouse on both C and Sea files
        lint.linters_by_ft = {
            c   = { "lighthouse" },
            sea = { "lighthouse" },
        }

        -- run on save
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end
        })
    end
}
