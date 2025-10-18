-- vim bindings

local maximized = false

local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

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

-- Random remaps
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
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>')
-- vim.keymap.set('n', '<leader>wm', maximize)
vim.keymap.set('n', '<leader>wm', cmd 'WindowsMaximize')
vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set('n', '<leader>;', 'gcc', {remap = true})
vim.keymap.set('v', '<leader>;', 'gc', {remap = true})

-- add semicolon at end of line
vim.keymap.set('n', '<leader>w;', 'm`A;<ESC>``')

vim.keymap.set('n', '<leader>o', 'm`o<ESC>``')
vim.keymap.set('n', '<leader>O', 'm`O<ESC>``')
vim.keymap.set('n', '<leader>BD', ':bufdo bd<CR>') -- kill all buffers

-- Show diagnostic error
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float) -- Open error floating

function ToggleVirtualText()
  local current = vim.diagnostic.config().virtual_text
  local new_value = not current
  vim.diagnostic.config({ virtual_text = new_value })
  -- print("virtual_text is now: " .. tostring(new_value))
end
vim.api.nvim_set_keymap('n', '<leader>di', ':lua ToggleVirtualText()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>de', vim.diagnostic.setloclist) -- Open all errors

-- vim.keymap.set('n', '<leader>di', function() vim.diagnostic.config({virtual_text=true}) end) -- Set inline errors


-- Swap to .h or .hpp when in .c or .cpp and vice versa
vim.keymap.set('n', '<leader>sh', function()
  local filepath = vim.api.nvim_buf_get_name(0)
  local filename = vim.fn.fnamemodify(filepath, ":t:r")
  local dir = vim.fn.fnamemodify(filepath, ":p:h")
  local ext = vim.fn.fnamemodify(filepath, ":e")
  local cur_dir_name = vim.fn.fnamemodify(filepath, ":p:h:t")

  local swap_exts = {
    c = { "h" },
    cpp = { "hpp", "h" },
    cc = { "hh", "h" },
    h = { "c", "cpp", "cc" },
    hpp = { "cpp" },
    hh = { "cc" },
    frag = { "vert" },
    vert = { "frag" }
  }
  
  -- TODO: Lookup can be made more efficient by splitting 
  -- inc and src search on the found extension
  local search_dirs = {
      cur_dir_name, "inc", "include", "Inc", "Include", "src", "Src", "Source", "source", "Interface", "interface"
  }

  local targets = swap_exts[ext]
  if not targets then
    vim.notify("Unsupported file type: " .. ext, vim.log.levels.WARN)
    return
  end

  local DEBUG = false
  local searches = ""

  for _, search_dir in ipairs(search_dirs) do
    local new_dir = vim.fn.fnamemodify(filepath, ":p:h:h")
      for _, new_ext in ipairs(targets) do
        local alt_path = new_dir .. "/" .. search_dir .. "/" .. filename .. "." .. new_ext
        if vim.fn.filereadable(alt_path) == 1 then
          vim.cmd("edit " .. alt_path)
          return
        end
        if DEBUG then
            searches = searches .. alt_path .. '\n'
        end
      end
  end

  if DEBUG then
      vim.notify("No matching header/source file found in " .. searches, vim.log.levels.INFO)
  else
      vim.notify("No matching header/source file found", vim.log.levels.INFO)
  end
end, { desc = "Swap header/source file" })

-- Fugitive binds
vim.keymap.set('n', '<leader>gl', ':G log<CR>')
vim.keymap.set('n', '<leader>gb', ':G blame<CR>')

-- LSP keybinds
-- vim.keymap.set('n', '<leader>ls', vim.lsp.buf.workspace_symbol)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
-- vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)

-- Tmux navigation
vim.keymap.set('n', '<C-h>', ':silent <C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-l>', ':silent <C-U>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<C-j>', ':silent <C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', ':silent <C-U>TmuxNavigateUp<cr>')

-- Remove annoying autoformat
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Start highlight when searcing, stop on esc, highligt on *
vim.cmd([[nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>]])
vim.keymap.set('n', '<ESC>', ':set nohls<cr>', {silent=true})
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = { "/", "?" },
  command = "set hlsearch",
})

-- nerdtree
-- vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>ft', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Put this in your init.lua or a Lua module you source from there

-- debugging

vim.keymap.set('n', '<leader>du', require("dapui").toggle)
vim.keymap.set('n', '<leader>dc', ":DapContinue<cr>")
vim.keymap.set('n', '<leader>db', cmd "DapToggleBreakpoint")
