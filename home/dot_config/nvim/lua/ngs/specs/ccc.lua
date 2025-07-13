-- ===================================================================
--  ccc.nvim
-- -------------------------------------------------------------------
--  https://github.com/uga-rosa/ccc.nvim
--  Color picker and highlighter
--  misc
-- -------------------------------------------------------------------
return {
  "uga-rosa/ccc.nvim",

  event = "VeryLazy",

  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}
