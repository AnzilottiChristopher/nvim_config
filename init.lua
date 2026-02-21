vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#3c3836", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#fabd2f", nocombine = true})

require('config.options')
require('config.keybinds')
require('config.lazy')
require('config.diagnostics')

vim.cmd.colorscheme("material")
vim.opt.shadafile = vim.fn.stdpath("data") .. "/shada/main.shada"
