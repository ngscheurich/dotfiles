-- ===================================================================
--  quicker.nvim
-- -------------------------------------------------------------------
--  https://github.com/stevearc/quicker.nvim
--  Improved UI and workflow for the quickfix list
--  workflow
-- -------------------------------------------------------------------
return {
  "stevearc/quicker.nvim",

  event = "FileType qf",

  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {},
}
