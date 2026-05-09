-- Get all the TODO Comments --
vim.o.grepprg = 'rg --vimgrep --smart-case'
vim.o.grepformat = '%f:%l:%c:%m'

vim.api.nvim_create_user_command('Todo', function()
    local cwd = vim.fn.getcwd()
    if vim.fn.executable('rg') == 1 then
        local results = vim.fn.systemlist('rg --vimgrep --smart-case "TODO|FIXME|HACK|NOTE" ' .. cwd)
        vim.fn.setqflist({}, 'r', { lines = results })
        vim.cmd('copen')
    else
        vim.cmd('silent! grep! /s "TODO" ' .. cwd)
        vim.cmd('copen')
    end
end, {})
