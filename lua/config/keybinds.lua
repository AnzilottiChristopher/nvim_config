-- Leader Key --
vim.g.mapleader = " "

-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- Return to normal mode --
vim.keymap.set("i", "jj", "<Esc>", {noremap = true, silent = true})
vim.keymap.set("i", "jk", "<Esc>:w<CR>", {noremap = true, silent = true})

-- Buffer/Tab Navigation --
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>bd", '<cmd>bdelete!<CR>', { noremap = true, silent = true })

-- Snacks terminal
-- vim.keymap.set("n", "<leader>t", function()
   -- require("snacks").terminal.toggle()
--end, { desc = "Toggle Terminal" })

-- Snacks Zen mode
vim.keymap.set("n", "<leader>z", "<cmd>lua Snacks.zen()<CR>", { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vim.keymap.set("t", "<leader>t", "<C-\\><C-n><cmd>lua require('snacks').terminal.toggle()<CR>", { desc = "Toggle Terminal" })

-- Snacks scratch buffer
vim.keymap.set('n', '<leader>s', function()
    require('snacks').scratch.open()
end, { noremap = true, silent = true, desc = "Open Scratch Buffer" })

-- Snacks rename
vim.keymap.set('n', '<leader>r', function()
    Snacks.rename.rename_file()
end, { noremap = true, silent = true, desc = "Rename File" })

-- LSP keybinds --
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- Hex editor
vim.keymap.set('n', '<leader>h', ':HexToggle<CR>', { desc = 'Toggle hex mode' })
