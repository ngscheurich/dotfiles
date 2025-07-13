-- ===================================================================
--  TreeSJ
-- -------------------------------------------------------------------
--  https://github.com/Wansmer/treesj
--  Split/join blocks of code
--  editing
-- -------------------------------------------------------------------
return {
  "Wansmer/treesj",

  opts = {
    use_default_keymaps = false,
  },

  keys = {
    { "<Leader>j", "<Cmd>TSJToggle<CR>", desc = "Join/split form" },
  },
}
