-- =========================================================
-- Autocommand Groups
-- =========================================================
local augroup = ngs.augroup

-- Highlight yanked text
augroup("yank", {"TextYankPost * lua vim.highlight.on_yank()"})
