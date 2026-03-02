-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  conform.nvim                                   │  formatting           │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Lightweight yet powerful formatter                                      │
-- ┖───────────────────────────────────────────────────────────────────────────┘
Config.later(function()
  vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

  require("conform").setup({
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
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
