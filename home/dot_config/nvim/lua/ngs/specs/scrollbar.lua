-- ===================================================================
--  nvim-scrollbar
-- -------------------------------------------------------------------
--  https://github.com/petertriho/nvim-scrollbar
--  Extensible scrollbar
--  ui
-- -------------------------------------------------------------------
return {
  "petertriho/nvim-scrollbar",

  opts = {
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
      search = true,
    },
  },
}
