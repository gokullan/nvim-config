local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local keyset = vim.keymap.set

vim.keymap.set("i", "<Tab>",
    function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#next'](1)
        end
        if check_back_space() then
            return vim.fn['coc#refresh']()
        end
        return "<Tab>"
    end
    , opts)
vim.keymap.set("i", "<S-Tab>", function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#prev'](1)
        end
        return "<S-Tab>"
end, opts)
vim.keymap.set("i", "<CR>", function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#confirm']();
        end
       return "\r"
end, opts)

-- Code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "k", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Reference: https://github.com/neoclide/coc.nvim/discussions/3776#discussioncomment-5463741
