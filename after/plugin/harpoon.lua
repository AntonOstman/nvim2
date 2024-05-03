--local mark = require('harpoon.mark')
--local ui = require('harpoon.ui')
--
--vim.keymap.set("n","<leader>a", mark.add_file)
--vim.keymap.set("n","<leader>e", ui.toggle_quick_menu)

local harpoon = require("harpoon")

harpoon:setup()

local conf  = require("telescope.config").values

--vim.keymap.set("n", "<leader>e", function() toggle_telescope(harpoon:list()) end,  { desc = "Open harpoon window"})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
