-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ///// \/// \\/// \///// \///////// \\\\\\/// \\\\\\\/// \\/// \\/////// \\
-- \/// \\///// /// \\/// \\\\\/// \\\\\\\\\/// \\\\\\\/// \\/// \/// \\/// \
-- \/// \\///////// \\/// \\\\\/// \\\\\\\\\/// \\\\\\\/// \\/// \///////// \
-- \/// \\/// ///// \\/// \\\\\/// \\\\\\\\\/// \\\\\\\/// \\/// \/// \\/// \
-- ///// \/// \\/// \///// \\\\/// \\\\/// \///////// \\/////// \\/// \\/// \
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--
-- ======================================================================
-- Neovim Configuration
-- ======================================================================
-- Author: N. G. Scheurich <nick@scheurich.me>
-- Repo: https://github.com/ngscheurich/dotfiles

require("ngs")

-- Disable some integrations
vim.g.loaded_netrw            = 1
vim.g.loaded_netrwPlugin      = 1
vim.g.loaded_python_provider  = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0

-- Enable 24-bit color
vim.o.termguicolors = true

-- Set colorscheme
vim.g.tokyonight_style = "night"
vim.cmd [[colorscheme tokyonight]]

-- Highlight yanked text
ngs.augroup("yank", {"TextYankPost * lua vim.highlight.on_yank()"})

-- Map <Leader> to <Space>
vim.g.mapleader = " "

vim.cmd [[hi MatchParen guibg=NONE gui=underline]]
