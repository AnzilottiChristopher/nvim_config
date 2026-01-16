return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
            "lua", "c", "rust", "bash", "json", "toml",
        },
        auto_install = false,
    },
}
