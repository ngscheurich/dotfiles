-- ===================================================================
--  flash.nvim
-- -------------------------------------------------------------------
--  https://github.com/folke/flash.nvim
--  Navigate using search labels
--  editing
-- -------------------------------------------------------------------
return {
  "folke/flash.nvim",

  event = "VeryLazy",
  opts = {},

  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
