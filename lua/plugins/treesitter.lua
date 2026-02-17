return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        vim.treesitter.language.register('python', 'python')
        
        -- Enable highlighting for all buffers
        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            pattern = "*.py",
            callback = function()
                -- Only start if buffer is a real Python file
                if vim.bo.filetype == "python" then
                    pcall(vim.treesitter.start, 0, 'python')
                end
            end,
        })
    end,
}
