-- key bindings
-- starting/ closing sessions
local function start_session()
    require('dapui').setup()
    require('dapui').open()
end

local function end_session()
    require('dap').terminate()
    -- require('dap').disconnect()
    -- require('dap').close()
end

vim.keymap.set('n', '<leader>s', start_session)
vim.keymap.set('n', '<leader>e', end_session)
--
vim.keymap.set('n', 'co', require 'dap'.continue)
vim.keymap.set('n', 'so', require 'dap'.step_over)
vim.keymap.set('n', 'si', require 'dap'.step_into)
vim.keymap.set('n', 'tb', require 'persistent-breakpoints.api'.toggle_breakpoint)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
-- view variables
vim.keymap.set('n', 'ev', require 'dapui'.eval)

require('dap').defaults.fallback.switchbuf = 'uselast'

-- configure dap for each language
require('plugin_config/dap_config/dap_node')
require('plugin_config/dap_config/dap_go')
