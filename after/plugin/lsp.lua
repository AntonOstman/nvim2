local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Diagnostic config
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 4,
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Floating window on hover
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.keymap.set('n', '<leader>d', function() 
    vim.diagnostic.open_float(nil, {focus=false});
end)
