-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  mini.base16                                    │  ui                 │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Fast colorschem implementation of Chris Kempson’s Base16              │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add({
    source = "nvim-mini/mini.base16",
    checkout = "stable",
  })
  require("ngs.util").load_theme()
  vim.g.ngs.theme.apply(require("mini.base16").setup)
end)

-- mini.icons
-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  mini.icons                                     │  ui                 │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Icon provider                                                         │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add({
    source = "https://github.com/echasnovski/mini.icons",
    checkout = "stable",
  })
  require("mini.icons").setup()
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Heirline                                       │  ui                 │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Status line framework                                                 │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add("rebelot/heirline.nvim")
  require("ngs.statusline").build()
end)
