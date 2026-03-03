local add = vim.pack.add
local later, on_filetype = Config.later, Config.on_filetype

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Minty                                          │  tools                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Preview and manipulate colors                                           │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function() add({ "https://github.com/nvzone/minty" }) end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  vim-dadbod-ui                                  │  tools                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Query relational databases with dadbod.vim                              │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_filetype("sql", function()
  add({
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  })

  vim.g.db_ui_use_nerd_fonts = 1
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Volt                                           │  tools                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Fast and reactive UI framework                                          │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function() add({ "https://github.com/nvzone/volt" }) end)
