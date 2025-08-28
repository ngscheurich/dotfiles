-- peek.nvim
local peek_ok, peek = pcall(require, "peek")
if peek_ok then
  -- TODO Post-checkout: vim.system({ "deno", "task", "--quiet build:fast" })
  peek.setup()

  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end
