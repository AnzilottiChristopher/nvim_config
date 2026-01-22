-- Leader Key --
vim.g.mapleader = " "
-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
-- Window Split
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true, desc = "Split vertically" })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true, desc = "Split horizontally" })
vim.keymap.set('n', '<leader>se', '<C-w>=', { noremap = true, silent = true, desc = "Equal splits" })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { noremap = true, silent = true, desc = "Close split" })
-- Navigate between splits --
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = "Move to left split" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = "Move to split below" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = "Move to split above" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = "Move to right split" })
-- Return to normal mode --
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Buffer/Tab Navigation (Updated for mini.tabline) --
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set('n', "<leader>bd", function()
    require("mini.bufremove").delete()
end, { noremap = true, silent = true, desc = "Delete buffer" })
-- Optional: Jump to buffer by number (if mini.tabline shows numbers)
vim.keymap.set('n', '<leader>1', ':buffer 1<CR>', { noremap = true, silent = true, desc = "Buffer 1" })
vim.keymap.set('n', '<leader>2', ':buffer 2<CR>', { noremap = true, silent = true, desc = "Buffer 2" })
vim.keymap.set('n', '<leader>3', ':buffer 3<CR>', { noremap = true, silent = true, desc = "Buffer 3" })
vim.keymap.set('n', '<leader>4', ':buffer 4<CR>', { noremap = true, silent = true, desc = "Buffer 4" })
vim.keymap.set('n', '<leader>5', ':buffer 5<CR>', { noremap = true, silent = true, desc = "Buffer 5" })
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
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })
-- Hex editor
vim.keymap.set('n', '<leader>h', ':HexToggle<CR>', { desc = 'Toggle hex mode' })
