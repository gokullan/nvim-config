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

function wrapper(f)
  local res, err = pcall(f)
  if err then
    print(err)
  end
end

function jsonToDict()
  wrapper(
    function ()
      vim.cmd("%s/null/None/g")
      vim.cmd("%s/true/True/g")
      vim.cmd("%s/false/False/g")
    end
  )
end

function jsonParser()
  wrapper(
    function()
      vim.cmd('%s/:\\([ ]*\\)\\([^\\\\]*\\)"{/:\\1\\2{/g')
    end
  )
  wrapper(
    function()
      vim.cmd('%s/}"/}/g')
    end
  )
  wrapper(
    function()
      vim.cmd('%s/\\([^\\\\]\\)\\\\"/\\1"/g')
    end
  )
  wrapper(
    function()
      vim.cmd('%s/\\(\\\\*\\)\\(\\\\\\{2\\}\\)"/\\1"/g')
    end
  )
  -- wrapper(
  --   function()
  --     vim.cmd('CocCommand formatJson')
  --   end
  -- )
  vim.cmd('noh')
end

vim.api.nvim_create_user_command('JsonToDict', jsonToDict, {})

vim.api.nvim_create_user_command('JsonParser', jsonParser, {})

-- enable copying to clipboard via "cc"
vim.keymap.set('v', 'cc', '"+y')
