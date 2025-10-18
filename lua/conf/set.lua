vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
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
vim.o.signcolumn = 'number'

-- turn off annoying thing dont remember ¯\_(ツ)_/¯
-- vim.o.modeline = false

-- colors
vim.o.termguicolors = true
vim.o.background = "dark"
-- TODO autocommand wrap to relevant file types
-- vim.o.wrap = true

-- Trainling whitespace

-- match errorMsg /\s\+$/

-- Set glsl files as glsl files
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.glsl", "*.geom","*.vert", "*.frag"},
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})

vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.cu"},
  callback = function()
      vim.cmd("set commentstring=//%s")
  end,
})

