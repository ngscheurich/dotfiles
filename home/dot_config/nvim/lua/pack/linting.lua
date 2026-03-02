-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  nvim-lint                                      │  linting              │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Asynchronous linter                                                     │
-- ┖───────────────────────────────────────────────────────────────────────────┘
Config.on_filetype("shell,sql", function()
  vim.pack.add({ "mfussenegger/nvim-lint" })

  require("lint").linters_by_ft = {
    sh = { "shellcheck" },
    sql = { "sqlfluff" },
  }
end)
