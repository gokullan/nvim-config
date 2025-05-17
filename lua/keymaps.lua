vim.keymap.set('v', 'cc', '"+yy')
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal Mode --

-- Window Navigation
keymap("n", "<C-s>", "<C-w><C-w>", opts)
keymap("t", "<C-s>", "<C-\\><C-n><C-w><C-w>", opts)
-- New Tab
keymap("n", "nt", ":tabnew<CR>", opts)
-- Open terminal
keymap("n", "te", ":edit term://bash<CR>", opts)
-- Open explorer
keymap("n", "e", ":NvimTreeToggle<CR>", opts)

-- Copy and search text (https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim)
-- "*y : Yank to register * 
-- /\V<C-R>s=escape(@*, '/\'): escape the characters '/' and '\' in register * and form a search expr. with the expression register (=)
keymap("v", "//", "\"*y/\\V<C-R>=escape(@*, '\\/')<CR><CR>", opts)

-- Copy and vimgrep text
keymap("v", "vg", "\"*y :vimgrep /<C-R>*/ lib/**<CR>", opts)
keymap("v", "vn", "\"*y :vimgrep /<C-R>*/ node_modules/**<CR>", opts)


-- Autocommands (to be moved to a separate file)
local autocmd_create = vim.api.nvim_create_autocmd

-- To have file explorer in every tab
-- autocmd_create({"TabNew"}, {
--   pattern = {"*"},
--   command = "NvimTreeToggle"
-- })

-- To modify "go-to" file navigations
autocmd_create({"VimEnter"}, {
  callback = function()
    vim.opt_local.isfname:append('@-@')
    vim.opt.path:append {"node_modules/"}
  end
})
