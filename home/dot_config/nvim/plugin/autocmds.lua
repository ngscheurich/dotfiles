-- =============================================================================
-- 󰣖 Autocommands
-- -----------------------------------------------------------------------------

-- vim.api.nvim_create_autocmd("FileType", {
--   desc = "Change the background of certain windows",
--   group = vim.api.nvim_create_augroup("ngs.filetype.background", {}),
--   pattern = "",
--   callback = function()
--     vim.opt_local.winhighlight = "Normal:NormalAlt"
--   end,
-- })

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Change the background of terminal buffers",
  group = vim.api.nvim_create_augroup("ngs.term.background", {}),
  pattern = "*",
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalAlt"
  end,
})
