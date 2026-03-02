Config.on_filetype("sql", function()
  vim.pack.add({
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  })

  vim.g.db_ui_use_nerd_fonts = 1
end)
