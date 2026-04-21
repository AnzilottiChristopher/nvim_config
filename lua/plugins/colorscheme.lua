return {
    {
        "oskarnurm/koda.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 999,
        config = function()
            require("material").setup({
                contrast = {
                    terminal = false,
                    sidebars = true,
                    floating_windows = true,
                    cursor_line = false,
                    non_current_windows = false,
                },
                styles = {
                    comments = { italic = true },
                    keywords = { bold = false },
                    functions = {},
                    variables = {},
                },
                plugins = {
                    "telescope",
                    "nvim-cmp",
                    "nvim-tree",
                    "which-key",
                },
            })

            -- All themes in cycle order
            local themes = {
                -- Material styles (set via vim.g.material_style then reload)
                { type = "material", style = "deep ocean" },
                { type = "material", style = "darker" },
                { type = "material", style = "oceanic" },
                { type = "material", style = "palenight" },
                { type = "material", style = "lighter" },
                -- Koda variants
                { type = "koda",     style = "koda-dark" },
                { type = "koda",     style = "koda-moss" },
                { type = "koda",     style = "koda-glade" },
                { type = "koda",     style = "koda-light" },
            }

            -- Track current index in a module-level variable
            _G._theme_index = 1

            local function apply_theme(t)
                if t.type == "material" then
                    vim.g.material_style = t.style
                    vim.cmd("colorscheme material")
                else
                    vim.cmd("colorscheme " .. t.style)
                end
                vim.notify("Theme: " .. t.style, vim.log.levels.INFO)
            end

            -- Time-based startup: before noon = material deep ocean, after = koda-dark
            local hour = tonumber(os.date("%H"))
            if hour < 12 then
                _G._theme_index = 1 -- deep ocean
                apply_theme(themes[1])
            else
                _G._theme_index = 6 -- koda-dark
                apply_theme(themes[6])
            end

            -- Cycle through all themes with <leader>tt
            vim.keymap.set("n", "<leader>tt", function()
                _G._theme_index = (_G._theme_index % #themes) + 1
                apply_theme(themes[_G._theme_index])
            end, { desc = "Cycle colorscheme" })
        end,
    },
}
