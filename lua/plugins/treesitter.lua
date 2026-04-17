return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua", "python", "rust", "typescript", "javascript", "html", "css",
                "dockerfile",
                "json", "yaml", "markdown", "bash", "regex",
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
