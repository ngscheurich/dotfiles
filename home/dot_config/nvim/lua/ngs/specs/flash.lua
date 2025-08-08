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

  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
      search = {
        enabled = true,
      },
    },
    prompt = {
      prefix = { { "󱐋", "FlashPromptIcon" } },
    },
  },

  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash (TS)" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Flash (Remote)" },
    { "R", mode = {"x", "o"}, function() require("flash").treesitter_search() end, desc = "Flash (TS Search)" },
    { "<C-z>", mode = "c", function() require("flash").toggle() end, desc = "Flash (Toggle)" },
  },
}
