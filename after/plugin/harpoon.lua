local harpoon = require("harpoon")

harpoon:setup()

local toggle_opts = {
    border = "rounded",
    title_pos = "center",
    ui_width_ratio = 0.40,
}


-- add to terminal list if current buf is terminal
local function term_add()
    if vim.bo.buftype == 'terminal' then
        harpoon:list("term"):add()
    else
        harpoon:list():add()
    end
end

-- create terminal if it does not exist
local function select_term(index)

    local item = harpoon:list("term"):get(index)
    if item then
        harpoon:list("term"):select(index)
        -- If terminal was previously killed 
        -- make sure we save this new one to harpoon
        local list = harpoon:list("term")
        local new_item = list.config:create_list_item()
        harpoon:list("term").items[index] = new_item
    else
        vim.cmd([[term]])
        term_add()
    end
end

vim.keymap.set("n", "<leader>a", function() term_add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list(),toggle_opts) end)

vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>h", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l>", function() harpoon:list():select(4) end)

-- Terminal lists
vim.keymap.set("n", "<leader>1", function() select_term(1) end)
vim.keymap.set("n", "<leader>2", function() select_term(2) end)
vim.keymap.set("n", "<leader>3", function() select_term(3) end)
vim.keymap.set("n", "<leader>4", function() select_term(4) end)
vim.keymap.set("n", "<leader>te", function() harpoon.ui:toggle_quick_menu(harpoon:list("term"), toggle_opts) end)



-- custom list example (that actually works)

--[=[
    ["test"] = {

        -- When you call list:add() this function is called and the return
        -- value will be put in the list at the end.
        --
        -- which means same behavior for prepend except where in the list the
        -- return value is added
        --
        -- @param possible_value string only passed in when you alter the ui manual
        create_list_item = function(possible_value)
            -- get the current line idx
            local idx = vim.fn.line(".")

            -- read the current line
            local cmd = vim.api.nvim_buf_get_lines(0, idx - 1, idx, false)[1]
            if cmd == nil then
                return nil
            end

            return {
                value = cmd,
                context = {},
            }
        end,

        select = function(list_item, list, option)
            -- WOAH, IS THIS HTMX LEVEL XSS ATTACK??
            vim.cmd(list_item.value)
        end

    }
vim.keymap.set("n", "<C-l>", function() custom.ui:toggle_quick_menu(custom:list()) end)
vim.keymap.set("n", "<C-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list("test")) end)
vim.keymap.set("n", "<leader>ha", function() harpoon:list("test"):add() end)
    --]=]
