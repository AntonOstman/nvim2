-- vim bindings

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
vim.keymap.set('n', '<leader>bd', buffer_delete)
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>')
vim.keymap.set('n', '<leader>wm', maximize)
vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set('n', '<leader>;', 'gcc', {remap = true})
vim.keymap.set('v', '<leader>;', 'gc', {remap = true})

vim.keymap.set('n', '<leader>w;', 'm`A;<ESC>``')
vim.keymap.set('n', '<leader>t', 'gt')

vim.keymap.set('n', '<leader>o', 'm`o<ESC>``')
vim.keymap.set('n', '<leader>O', 'm`O<ESC>``')
vim.keymap.set('n', '<leader>BD', ':bufdo bd<CR>') -- kill all buffers

vim.cmd([[nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>]])
vim.keymap.set('n', '<ESC>', ':set nohls<cr>', {silent=true})

-- Fugitive binds
vim.keymap.set('n', '<leader>gl', ':G log<CR>')
vim.keymap.set('n', '<leader>gb', ':G blame<CR>')

-- LSP keybinds
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.workspace_symbol)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Tmux navigation
vim.keymap.set('n', '<C-h>', ':silent <C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-l>', ':silent <C-U>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<C-j>', ':silent <C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', ':silent <C-U>TmuxNavigateUp<cr>')

-- Remove annoying autoformat

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = { "/", "?" },
  command = "set hlsearch",
})
