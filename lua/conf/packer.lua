-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use { "ellisonleao/gruvbox.nvim",
    as = 'gruvbox'}

use { "rose-pine/neovim"}

use {"catppuccin/nvim"}

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
-- use('nvim-treesitter/playground')
use{'nvim-lua/plenary.nvim'}
use{'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { {"nvim-lua/plenary.nvim"} }
}
use('mbbill/undotree')
use('tpope/vim-fugitive')
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    -- {'hrsh7th/cmp-buffer'},
    -- debugger
    -- {"mfussenegger/nvim-dap"},
    -- {"jay-babu/mason-nvim-dap.nvim"},
  }
}

use{"christoomey/vim-tmux-navigator"}
use{"nvim-treesitter/nvim-treesitter-context"}
-- use{'mfussenegger/nvim-lint'}
use{'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
}

-- use{'AndrewRadev/linediff.vim'}
end)
