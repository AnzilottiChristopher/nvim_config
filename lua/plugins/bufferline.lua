return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                indicator = {
                    icon = '▎',
                    style = 'icon',
                },
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "󰅖",
                left_trunc_marker = "",
                right_trunc_marker = "",

                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },
            },
        })
    end,
} 
