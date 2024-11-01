-- load all plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- markdown viewer
Plug(
    'iamcco/markdown-preview.nvim',
    {['do'] = function() vim.fn['mkdp#util#install']() end,}
)
-- debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/neodev.nvim'  -- recommended by nvim-dap-ui
Plug 'Weissle/persistent-breakpoints.nvim'
-- autocomplete
Plug(
    'neoclide/coc.nvim',
    {branch = 'release'}
) 
-- file explorer
Plug 'nvim-tree/nvim-tree.lua'
-- git lens
Plug 'APZelos/blamer.nvim'
-- themes
Plug 'EdenEast/nightfox.nvim'

vim.call('plug#end')

-- configure all plugins
require('plugin_config')
require("nvim-tree").setup()
require('persistent-breakpoints').setup{
	load_breakpoints_event = { "BufReadPost" }
}
vim.g.blamer_enabled = true -- for blamer
