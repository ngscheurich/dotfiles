-- =============================================================================
--   Commands
-- -----------------------------------------------------------------------------

local autocmd = Config.autocmd
local command = vim.api.nvim_create_user_command

-- Autocommands ----------------------------------------------------------------
autocmd(
  "TermOpen",
  "*",
  function() vim.opt_local.winhighlight = "Normal:NormalAlt" end,
  "Change the background of terminal buffers"
)
