-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  ccc.nvim                                       │  apps               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Color picker                                                          │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("uga-rosa/ccc.nvim")
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  kulala.nvim                                    │  apps               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  HTTP client                                                           │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("mistweaverco/kulala.nvim")

  vim.api.nvim_create_autocmd("FileType", {
    desc = "Load kulala.nvim",
    group = vim.api.nvim_create_augroup("ngs.packages.kulala", {}),
    pattern = { "http", "rest" },
    callback = function()
      if not package.loaded["kulala"] then
        local kulala_ok, kulala = pcall(require, "kulala")
        if kulala_ok then
          kulala.setup()
        end
      end
    end,
  })
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  vim-dadbod-ui                                  │  apps               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Relational database client                                            │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "kristijanhusak/vim-dadbod-ui",
    depends = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
  })

  vim.g.db_ui_use_nerd_fonts = 1
end)
