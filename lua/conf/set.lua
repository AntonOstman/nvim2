vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.o.splitbelow = true

vim.o.cb = 'unnamedplus'
vim.o.signcolumn = 'no'

-- turn off annoying thing dont remember ¯\_(ツ)_/¯
vim.o.modeline = false

-- colors
vim.o.termguicolors = true
vim.o.background = "dark"

-- TODO autocommand wrap to relevant file types
-- vim.o.wrap = true

--Trainling whitespace
-- match errorMsg /\s\+$/

vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.glsl", "*.vert", "*.frag"},
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})
