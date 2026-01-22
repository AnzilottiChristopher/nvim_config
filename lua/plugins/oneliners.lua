return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    --[[ {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            fast_wrap = {},
        },
    }, --]]
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup{
                log_level = "error",
                auto_session_suppress_dirs = {"~/", "~/Downloads/"},
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require('lualine').setup {
                option = {
                    theme = 'auto',
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                }
        }
        end
    },
    {
        'folke/noice.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
        config = function ()
            require('noice').setup()
        end
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'doom',
                config = {
                    header = {
                        '',
                        '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
                        '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
                        '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
                        '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
                        '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
                        '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
                        '',
                    },
                    center = {
                        {
                            icon = ' ',
                            desc = 'Find File in Project    ',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            icon = ' ',
                            desc = 'Recent Files in Project ',
                            action = 'Telescope oldfiles cwd_only=true',
                            key = 'r',
                        },
                        {
                            icon = ' ',
                            desc = 'Find Word in Project    ',
                            action = 'Telescope live_grep',
                            key = 'g',
                        },
                        {
                            icon = ' ',
                            desc = 'New File                ',
                            action = 'enew',
                            key = 'e',
                        },
                    },
                    footer = function()
                        return { '', 'Working directory: ' .. vim.fn.getcwd() }
                    end
                }
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            require('ibl').setup()
        end
    },
    {
        'RaafatTurki/hex.nvim',
        config = function()
            require('hex').setup()
          end
    },
    {
        'karb94/neoscroll.nvim',
        config = function ()
            require('neoscroll').setup({
                easing_function = "quadratic",
                hide_cursor = true,
                stop_eof = true,
                respect_scrolloff = true,
                cursor_scrolls_alone = true,
            })
            vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
            vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
        end
    }
}
