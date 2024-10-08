local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', ":Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader>pd', builtin.diagnostics)

vim.keymap.set('n', '<leader>lr', builtin.lsp_references)
vim.keymap.set('n', '<leader>lci', builtin.lsp_incoming_calls)
vim.keymap.set('n', '<leader>lco', builtin.lsp_outgoing_calls)
vim.keymap.set('n', '<leader>ltd', builtin.lsp_type_definitions)
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>ld', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep >") });
end)
local telescope = require('telescope')

telescope.setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search

          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.env/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/dist/*",
          "--glob=!**/*.png",
          "--glob=!**/*.jpg",
          "--glob=!**/*.jpeg",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
        },

        },
    pickers = {
        find_files = {
            hidden = true,
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob=!**/.git/*",
                "--glob=!**/.env/*",
                "--glob=!**/.idea/*",
                "--glob=!**/.vscode/*",
                "--glob=!**/build/*",
                "--glob=!**/dist/*",
                "--glob=!**/*.png",
                "--glob=!**/*.jpg",
                "--glob=!**/yarn.lock",
                "--glob=!**/package-lock.json",
            },
        },
    }
}
