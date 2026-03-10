local add = vim.pack.add
local later, now_if_args = Config.later, Config.now_if_args

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
now_if_args(function()
  add({
    "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/kristijanhusak/vim-dadbod-completion",
    "https://github.com/tpope/vim-dadbod",
  })

  vim.g.db_ui_use_nerd_fonts = 1
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Volt                                           │  tools                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Fast and reactive UI framework                                          │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function() add({ "https://github.com/nvzone/volt" }) end)
