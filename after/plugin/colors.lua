
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

TransEn()
