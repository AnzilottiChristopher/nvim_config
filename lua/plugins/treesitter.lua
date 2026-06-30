return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
        local is_wsl = vim.fn.has('wsl') == 1
        local tree_sitter_sea_path = is_wsl
            and "/home/chris/dev_linux/rust_projects/tree-sitter-sea"
            or "C:/Users/anzil/dev/rust_projects/tree-sitter-sea"

        vim.filetype.add({
            extension = {
                sea = "sea",
            }
        })

        -- register immediately, not inside a TSUpdate autocmd
        require('nvim-treesitter.parsers').get_parser_configs().sea = {
            install_info = {
                url = tree_sitter_sea_path,
                files = { "src/parser.c" },
                generate_requires_npm = false,
                requires_generate_from_grammar = false,
            },
            filetype = "sea",
        }

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
