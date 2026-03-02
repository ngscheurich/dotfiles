-- =============================================================================
-- 󰓅 Diagnostics
-- -----------------------------------------------------------------------------

local ERROR, WARN, INFO, HINT =
  vim.diagnostic.severity.ERROR,
  vim.diagnostic.severity.WARN,
  vim.diagnostic.severity.INFO,
  vim.diagnostic.severity.HINT

local diagnostic_opts = {
  signs = {
    priority = 9999,
    severity = { min = WARN, max = ERROR },
    text = { [ERROR] = "", [WARN] = "", [INFO] = "", [HINT] = "" },
  },

  underline = { severity = { min = HINT, max = ERROR } },

  virtual_lines = false,
  virtual_text = { current_line = true },

  update_in_insert = false,
}

Config.later(function() vim.diagnostic.config(diagnostic_opts) end)
