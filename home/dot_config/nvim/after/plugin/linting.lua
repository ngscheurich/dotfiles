-- nvim-lint
local function load_lint()
  local lint_ok, lint = pcall(require, "lint")
  if lint_ok then
    lint.linters_by_ft = {
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
    }
  end
end

vim.api.nvim_create_autocmd("FileType", {
  desc = "Load nvim-lint",
  group = vim.api.nvim_create_augroup("ngs.packages.lint", {}),
  pattern = { "shell", "sql" },
  callback = function()
    if not package.loaded["lint"] then
      load_lint()
    end
  end,
})
