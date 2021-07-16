-- =========================================================
-- Autocommand Groups
-- =========================================================

local vim = ngs.vim

-- Highlight yanked text
vim.augroup("yank", function()
  vim.autocmd("TextYankPost", "*", "lua vim.highlight.on_yank()")
end)
