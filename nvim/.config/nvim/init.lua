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

_G.ngs = { vim = {}, util = {} }
require("ngs.vim")
require("ngs.util")

vim.g.tokyonight_style = "night"
vim.cmd [[colorscheme tokyonight]]

require("ngs.completion")
require("ngs.editing")
require("ngs.formatting")
require("ngs.interface")
require("ngs.lspconfig")
require("ngs.navigation")
require("ngs.statusline")
require("ngs.treesitter")
