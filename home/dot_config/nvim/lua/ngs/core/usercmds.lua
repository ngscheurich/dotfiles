local function lsp_stop()
  vim.lsp.stop_client(vim.lsp.get_clients())
end

local function lsp_restart()
  lsp_stop()
  vim.cmd.edit()
end

vim.api.nvim_create_user_command(
  "LspInfo",
  ":checkhealth vim.lsp",
  { desc = "Alias to `:checkhealth vim.lsp`" }
)
vim.api.nvim_create_user_command("LspStop", lsp_stop, { desc = "Stop all active LSP clients" })
vim.api.nvim_create_user_command(
  "LspRestart",
  lsp_restart,
  { desc = "Restart LSP clients for the current buffer" }
)
