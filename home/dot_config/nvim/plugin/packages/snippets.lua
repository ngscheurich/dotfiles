-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  nvim-scissors                                  │  snippets           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Snippet creation and management                                       │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("chrisgrieser/nvim-scissors")
  require("scissors").setup()
end)
