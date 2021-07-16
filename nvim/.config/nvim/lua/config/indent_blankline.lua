vim.g.indent_blankline_enabled = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char = "│"

ngs.nnoremap("<Leader>ui", "<Cmd>IndentBlanklineToggle<CR>")
