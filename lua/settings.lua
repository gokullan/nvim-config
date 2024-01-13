-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.shiftwidth = 2
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.o.number = true
vim.o.autoindent = false
vim.o.expandtab = true
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
vim.g.netrw_liststyle = 3
