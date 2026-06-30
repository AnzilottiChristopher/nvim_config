return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
        vim.filetype.add({
            extension = {
                sea = "sea",
            }
        })

        -- tells Neovim's core treesitter that filetype "sea" maps to
        -- a parser/language also named "sea" (the manually-compiled .so)
        vim.treesitter.language.register("sea", "sea")

        -- auto-enable highlighting and indentation for sea files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "sea",
            callback = function()
                local ok = pcall(vim.treesitter.start)
                if not ok then
                    -- parser not installed/compiled yet, skip silently
                end
                vim.bo.cindent = true
                vim.bo.indentexpr = ""
            end,
        })

        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua", "python", "rust", "typescript", "javascript", "html", "css",
                "dockerfile", "json", "yaml", "markdown", "bash", "regex",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
