-- =================================================================
--  vim-dadbod-ui
-- -----------------------------------------------------------------
--  https://github.com/kristijanhusak/vim-dadbod-ui
--  Relational database client
--  misc
-- -----------------------------------------------------------------
MiniDeps.add({
  source = "https://github.com/kristijanhusak/vim-dadbod-ui",
  depends = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
})

vim.g.db_ui_use_nerd_fonts = 1
