-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  nvim-lint                                      │  linting              │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Asynchronous linter                                                     │
-- ┖───────────────────────────────────────────────────────────────────────────┘
Config.on_filetype("sh,sql", function()
  vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

  require("lint").linters_by_ft = {
    sh = { "shellcheck" },
    sql = { "sqlfluff" },
  }
end)
