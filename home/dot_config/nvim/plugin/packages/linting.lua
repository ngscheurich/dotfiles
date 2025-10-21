-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  nvim-lint                                      │  linting            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Asynchronous linter                                                   │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("mfussenegger/nvim-lint")

  vim.api.nvim_create_autocmd("FileType", {
    desc = "Load nvim-lint",
    group = vim.api.nvim_create_augroup("ngs.packages.lint", {}),
    pattern = { "shell", "sql" },
    callback = function()
      if not package.loaded["lint"] then
        require("lint").linters_by_ft = {
          sh = { "shellcheck" },
          sql = { "sqlfluff" },
        }
      end
    end,
  })
end)
