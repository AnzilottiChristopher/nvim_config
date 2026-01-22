return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    config = function()
        require("snacks").setup({
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            rename = { enabled = true },
            scratch = { enabled = true },
            terminal = {
                enabled = false,
                win = {
                    style = "terminal",
                    width = 0.7,
                    height = 0.7,
                },
                shell = "pwsh",
            },
            toggle = { enabled = true },
            words = { enabled = true },

            -- explicitly disabled
            zen = {
                enabled = true,
                win = {
                    style = "zen",
                    width = 0.9,
                    height = 0.9,
                },
                backdrop = {
                    transparent = false,
                    blend = 95,
                },
            },
            scroll = { enabled = false },
            scope = { enabled = false },
            dashboard = { enabled = false },
            picker = { enabled = false },
            explorer = { enabled = false },
            git = { enabled = false },
        })
    end,
}
