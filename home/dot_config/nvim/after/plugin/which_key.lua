-- ===================================================================
--  WhichKey
-- -------------------------------------------------------------------
--  https://github.com/folke/which-key.nvim
--  Show available keybindings as you type
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("folke/which-key.nvim")

local which_key = require("which-key")

which_key.setup({
  icons = {
    mappings = false,
  },
})

which_key.add({
  { "<Leader>a", group = "ai" },
  { "<Leader>ac", group = "codecompanion" },
  { "<Leader>e", group = "explore" },
  { "<Leader>f", group = "find" },
  { "<Leader>g", group = "git" },
  { "<Leader>l", group = "list" },
  { "<Leader>n", group = "notes" },
  { "<Leader>s", group = "search" },
  { "<Leader>t", group = "toggle" },
  { "<LocalLeader>t", group = "test" },
})
