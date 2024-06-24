
local function move_to_tree()
    if vim.bo.buftype == 'nowrite' and vim.fn.winnr() == 1 then
        -- This means we are most likely in the undotree
        vim.cmd("wincmd p")
        vim.cmd.UndotreeToggle()
    else
        vim.cmd.UndotreeToggle()
        vim.cmd("1wincmd w")
    end
end


vim.keymap.set("n", "<leader>u", function() move_to_tree() end)
