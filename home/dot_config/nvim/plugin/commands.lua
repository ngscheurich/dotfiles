vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })

vim.api.nvim_create_user_command("LspStop", function()
  vim.lsp.stop_client(vim.lsp.get_clients())
end, { desc = "Stop all active LSP clients" })

vim.api.nvim_create_user_command("LspRestart", function()
  -- lsp_stop()
  vim.cmd.edit()
end, { desc = "Restart LSP clients for the current buffer" })
