--Extracting Code Snippet to a function

vim.api.nvim_create_user_command('Extract', function(opts)
    -- set the visual selection range
    vim.api.nvim_buf_set_mark(0, '<', opts.line1, 0, {})
    vim.api.nvim_buf_set_mark(0, '>', opts.line2, 0, {})

    -- trigger code actions with the range
    vim.lsp.buf.code_action({
        range = {
            start = { opts.line1, 0 },
            ['end'] = { opts.line2, 0 },
        },
        filter = function(action)
            local title = action.title:lower()
            return title:match('extract') ~= nil
        end,
    })
end, { range = true })
