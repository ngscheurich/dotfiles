-- ===================================================================
--  Catppuccin
-- -------------------------------------------------------------------
--  https://github.com/catppuccin/nvim
--  Community-driven theming with pastel defaults
--  ui
-- -------------------------------------------------------------------
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  cond = vim.g.ngs.theme.colorscheme == "catppuccin",

  config = function()
    local catppuccin = require("catppuccin")
    vim.g.ngs.theme.apply(catppuccin.setup)
  end,
}
