-- =============================================================================
--  Keymaps
-- -----------------------------------------------------------------------------

local util = require("ngs.util")

vim.keymap.set("n", "<Left>", "<C-w>h")
vim.keymap.set("n", "<Down>", "<C-w>j")
vim.keymap.set("n", "<Up>", "<C-w>k")
vim.keymap.set("n", "<Right>", "<C-w>l")

vim.keymap.set("n", "<Leader>un", function()
  util.toggle_opt("number")
end, { desc = "Line numbers" })

vim.keymap.set("n", "<Leader>uw", function()
  util.toggle_opt("list")
end, { desc = "Whitespace" })

vim.keymap.set("n", "<Leader>uc", function()
  util.toggle_opt("cursorline")
end, { desc = "Cursorline" })

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<LocalLeader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

vim.keymap.set("n", "<Leader>td", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Diagnostic virtual lines" })
