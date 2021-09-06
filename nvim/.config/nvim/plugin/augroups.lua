-- =========================================================
-- Autocommand Groups
-- =========================================================

-- Highlight yanked text
ngs.augroup("yank", {"TextYankPost * lua vim.highlight.on_yank()"})
