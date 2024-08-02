
function TransDis(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
end
function TransEn(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

    --if os.getenv("TMUX") ~= nil then
     --   vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
     --   vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
   -- end
end
require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "macchiato",
        dark = "mocha",
    },
    no_italic = true, -- Force no italic
})
-- TransEn()
vim.cmd('colorscheme catppuccin')
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd('colorscheme gruvbox')
