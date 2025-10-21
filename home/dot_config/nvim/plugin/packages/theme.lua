-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Heirline                                       │  ui                 │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Statusline framework                                                  │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add("rebelot/heirline.nvim")
  require("ngs.statusline").build()
end)

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
