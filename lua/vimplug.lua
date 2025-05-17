-- load all plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- markdown viewer
Plug(
    'iamcco/markdown-preview.nvim',
    {['do'] = function() vim.fn['mkdp#util#install']() end,}
)
vim.g.mkdp_markdown_css = ''
-- vim.g.mkdp_markdown_css = '/home/d2c-gokulas/playground/go-packages/slides/markdown1.css'

-- debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'folke/neodev.nvim'  -- recommended by nvim-dap-ui
Plug 'nvim-neotest/nvim-nio'
Plug 'Weissle/persistent-breakpoints.nvim'
Plug 'mfussenegger/nvim-dap-python'

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
-- Plug 'EdenEast/nightfox.nvim'

-- file searching
Plug 'nvim-lua/plenary.nvim'
Plug(
    'nvim-telescope/telescope.nvim', 
    {tag = '0.1.8' }
)
-- vim-latex-live-preview
Plug(
    'xuhdev/vim-latex-live-preview',
    {['for'] = 'tex'}
)

vim.call('plug#end')

-- configure all plugins
require('plugin_config')
require("nvim-tree").setup()
require('persistent-breakpoints').setup{
	load_breakpoints_event = { "BufReadPost" }
}
vim.g.blamer_enabled = true -- for blamer
vim.g.livepreview_previewer = 'okular' -- for vim-latex-live-preview
