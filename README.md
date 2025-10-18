# Requirements

After installing packer enter packer.lua source and run :PackerSync

``` bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Tools

``` bash
sudo apt install build-essential ripgrep xclip
```

Some code requries tree-sitter-cli for tree-sitter to work (e.g. latex)

```bash
npm install tree-sitter-cli
```

## Debuggers

To use DAP a debug adapter config is required.

Compile your program with debug flags and supply the binary. 
A source map could be required if debugging works but stepping through code does not seem to work

Create a dap-configs.lua file and add the configs.

```
local dap = require("dap")

dap.configurations.c = {
  {
    name = "Launch",
    type = "cpptools",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
    sourceFileMap = {
      ["/From/Incorrect/Path"] = '/To/Correct/Absolute/Path'
      },
  },
  {
    name = "Select and attach to process",
    type = "cpptools",
    request = "attach",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cpptools',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  }
}
```
