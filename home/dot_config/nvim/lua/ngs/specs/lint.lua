-- ===================================================================
--  nvim-lint
-- -------------------------------------------------------------------
--  https://github.com/mfussenegger/nvim-lint
--  Asynchronous linter
--  linting
-- -------------------------------------------------------------------
return {
  "mfussenegger/nvim-lint",

  ft = { "sh", "sql" },

  config = function()
    require("lint").linters_by_ft = {
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
    }
  end,
}
