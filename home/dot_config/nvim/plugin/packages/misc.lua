-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Conjure                                        │  misc               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Conversational software development                                   │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("Olical/conjure")
  vim.g["conjure#mapping#doc_word"] = "<LocalLeader>k"
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  ccc.nvim                                       │  misc               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Color picker and manager                                              │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("uga-rosa/ccc.nvim")

  local ccc = require("ccc")

  vim.api.nvim_create_user_command("CccLoad", function()
    ccc.setup({
      save_on_quit = true,
      alpha_show = "hide",
      pickers = {
        ccc.picker.hex,
        ccc.picker.css_rgb,
        ccc.picker.css_hsl,
      },
    })
    vim.api.nvim_del_user_command("CccLoad")
  end, {})
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  hotreload.nvim                                 │  misc               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Reloads Neovim buffers when files change on disk                      │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("diogo464/hotreload.nvim")
  require("hotreload").setup({})
end)
