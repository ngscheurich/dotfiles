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
    local mod = string.format("ngs.specs.catppuccin.mods.%s", vim.g.ngs.theme.mod)
    require(mod).apply(catppuccin.setup)
  end,
}
