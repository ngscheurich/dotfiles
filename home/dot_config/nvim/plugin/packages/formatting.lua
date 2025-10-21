-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Conform                                        │  formatting         │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Lightweight yet powerful formatter                                    │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("stevearc/conform.nvim")

  require("conform").setup({
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      css = { "prettier" },
      fennel = { "fnlfmt" },
      graphql = { "prettier" },
      html = { "prettier" },
      http = { "kulala-fmt" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      nix = { "nixfmt" },
      python = { "black" },
      scss = { "prettier" },
      sh = { "shfmt" },
      sql = { "sleek" },
      toml = { "tombi" },
      typescript = { "prettier" },
      xml = { "xmlformatter" },
      yaml = { "prettier" },
    },
  })
end)
