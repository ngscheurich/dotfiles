-- ===================================================================
--  nvim-scrollbar
-- -------------------------------------------------------------------
--  https://github.com/petertriho/nvim-scrollbar
--  Extensible scrollbar
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("petertriho/nvim-scrollbar")

require("scrollbar").setup({
  hide_if_all_visible = true,
  excluded_buftypes = {},
  excluded_filetypes = {
    "popup",
    "blink-cmp-menu",
    "blink-cmp-signature",
    "blink-cmp-documentation",
  },
  handlers = {
    gitsigns = true,
  },
})
