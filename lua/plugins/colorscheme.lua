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

            local themes = {
                { type = "material", style = "deep ocean" },
                { type = "material", style = "darker" },
                { type = "material", style = "oceanic" },
                { type = "material", style = "palenight" },
                { type = "koda",     style = "koda-dark" },
                { type = "koda",     style = "koda-moss" },
            }

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

            -- Returns the intended theme index based on time of day:
            --   00–11  morning   → deep ocean (index 1)
            --   12–17  afternoon → koda-dark  (index 5)
            --   18–23  evening   → koda-moss  (index 6)
            local function time_theme_index(hour)
                if hour < 12 then
                    return 1 -- deep ocean
                elseif hour < 18 then
                    return 5 -- koda-dark
                else
                    return 6 -- koda-moss
                end
            end

            -- Startup: apply the time-appropriate theme
            local hour = tonumber(os.date("%H"))
            _G._theme_index = time_theme_index(hour)
            apply_theme(themes[_G._theme_index])

            -- Auto-switch on the minute boundary while nvim is open.
            -- Only switches if the current theme doesn't match the time slot,
            -- so manual cycles via <leader>tt are respected until the next
            -- time-slot boundary naturally triggers a switch.
            local timer = vim.loop.new_timer()
            timer:start(60000, 60000, vim.schedule_wrap(function()
                local current_hour = tonumber(os.date("%H"))
                local wanted = time_theme_index(current_hour)
                local current = vim.g.colors_name or ""

                local slot_themes = {
                    [1] = "material",   -- deep ocean → colors_name is "material"
                    [5] = "koda%-dark", -- lua pattern for koda-dark
                    [6] = "koda%-moss", -- lua pattern for koda-moss
                }

                -- Only auto-switch when we've crossed into a new time slot
                if not current:find(slot_themes[wanted]) then
                    _G._theme_index = wanted
                    apply_theme(themes[_G._theme_index])
                end
            end))

            -- Cycle through all themes with <leader>tt
            vim.keymap.set("n", "<leader>tt", function()
                _G._theme_index = (_G._theme_index % #themes) + 1
                apply_theme(themes[_G._theme_index])
            end, { desc = "Cycle colorscheme" })
        end,
    },
}
