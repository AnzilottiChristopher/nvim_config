return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
        -- detect WSL
        local is_wsl = vim.fn.has('wsl') == 1
        local tree_sitter_sea_path = is_wsl
            and "/mnt/c/Users/anzil/dev/rust_projects/tree-sitter-sea"
            or "C:/Users/anzil/dev/rust_projects/tree-sitter-sea"

        -- register .sea filetype
        vim.filetype.add({
            extension = {
                sea = "sea",
            }
        })

        -- add Sea parser via TSUpdate autocommand — new API
        vim.api.nvim_create_autocmd('User', {
            pattern = 'TSUpdate',
            callback = function()
                require('nvim-treesitter.parsers').sea = {
                    install_info = {
                        url = tree_sitter_sea_path,
                        files = { "src/parser.c" },
                        generate_requires_npm = false,
                        requires_generate_from_grammar = false,
                    },
                    filetype = "sea",
                }
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
