--require("neovim-project").setup {
--  projects = { -- define project roots
--    "~/projects/seegoals/robot",
--    "~/.config/nvim",
--    }
--} 
require('telescope').load_extension('projects')

require("project_nvim").setup {
    detection_methods = { "pattern" }
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
