-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  nvim-lspconfig                                 │  lsp                  │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Language server configuration recipes for the LSP client                │
-- ┖───────────────────────────────────────────────────────────────────────────┘
Config.later(function()
  vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
  vim.lsp.enable({ "lua_ls" })
end)
