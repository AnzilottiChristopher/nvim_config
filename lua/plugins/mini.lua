return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup()
        require("mini.surround").setup()
        require("mini.move").setup()
        require("mini.comment").setup()
        require("mini.bufremove").setup()
        require("mini.pairs").setup()

        vim.keymap.set('i', '<BS>', function()
            local line = vim.api.nvim_get_current_line()
            if line:match('^%s*$') then
                vim.schedule(function()
                    local row = vim.api.nvim_win_get_cursor(0)[1]
                    vim.api.nvim_del_current_line()
                    if row > 1 then
                        local prev_line = vim.api.nvim_buf_get_lines(0, row - 2, row - 1, false)[1]
                        vim.api.nvim_win_set_cursor(0, { row - 1, #prev_line })
                    end
                end)
                return ''
            else
                return MiniPairs.bs()
            end
        end, { expr = true, replace_keycodes = false })

        vim.keymap.set("n", "<leader>bd", function()
            require("mini.bufremove").delete()
        end, { desc = "Delete Buffer" })
    end,
}
