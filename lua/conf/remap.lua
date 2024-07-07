-- vim bindings

local cmp = require("cmp")

local maximized = false

local function maximize()
    if maximized then
        vim.cmd("wincmd=")
        maximized = false
    else
        vim.cmd("wincmd|")
        maximized = true
    end
end


local function buffer_delete()
    if vim.bo.buftype == 'terminal' then
        vim.cmd("bd!")
    else
        vim.cmd("bd")
    end
end
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.q)
vim.keymap.set('n', '<leader>wv', '<C-w>v<C-w>l')
vim.keymap.set('n', '<leader>w-', '<C-w>s<C-w>j')
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>')
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>')
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>')
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>')
vim.keymap.set('n', '<leader>wd', '<C-w>c')
vim.keymap.set('n', '<leader>bd', function() buffer_delete() end)
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>')
vim.keymap.set('n', '<leader>wm', function() maximize() end)
vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set('n', '<leader>;', 'gcc', {remap = true})
vim.keymap.set('v', '<leader>;', 'gc', {remap = true})

-- Tmux navigation
--

vim.keymap.set('n', '<C-h>', ':silent <C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-l>', ':silent <C-U>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<C-j>', ':silent <C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', ':silent <C-U>TmuxNavigateUp<cr>')

