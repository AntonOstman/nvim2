

-- vim bindings
--
--
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

-- Tmux navigation

vim.keymap.set('n', '<C-h>', ':silent <C-U>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<C-l>', ':silent <C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-j>', ':silent <C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', ':silent <C-U>TmuxNavigateUp<cr>')

-- nvim terminal 
vim.api.nvim_set_keymap("t", '<C-;>', "<C-\\><C-n>", {noremap = true})
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)


-- Projects
--vim.keymap.set('n', '<leader>pp', function() require'telescope'.extensions.projects.projects{} end)
-- v':Telescope neovim-project discover<enter>'':Telescope neovim-project discover<enter>'im.keymap.set('n', '<leader>Ph', ':Telescope neovim-project history<enter>', opts)

