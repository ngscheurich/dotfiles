-- =========================================================
-- Autocommand Groups
-- =========================================================

local vim = ngs.vim

-- Highlight yanked text
vim.augroup("yank", function()
  vim.autocmd("TextYankPost", "*", "lua vim.highlight.on_yank()")
end)

-- TODO:: Why the fuck is the Elixir LS dumping every message ever sometimes?
vim.augroup("suppress-more", function ()
  vim.autocmd("BufEnter", "*.ex,*.exs", "set nomore")
end)
