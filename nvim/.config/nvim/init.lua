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
vim.g._tokyonight_colors = {
  bg_sidebar = "#1d1f21",
  fg_sidebar = "#c5c8c6",

  none           = "NONE",
  bg_dark        = "#1f2335",
  bg             = "#24283b",
  bg_highlight   = "#292e42",

  terminal_black = "#414868",
  dark3          = "#545c7e",
  comment        = "#565f89",
  dark5          = "#737aa2",

  fg_gutter      = "#3b4261",
  fg_dark        = "#a9b1d6",
  fg             = "#c0caf5",

  blue7          = "#394b70",
  blue0          = "#3d59a1",
  blue           = "#7aa2f7",

  cyan           = "#7dcfff",
  blue5          = "#89ddff",

  green2         = "#41a6b5",
  blue2          = "#0db9d7",
  blue1          = "#2ac3de",

  purple         = "#9d7cd8",
  magenta        = "#bb9af7",

  orange         = "#ff9e64",
  yellow         = "#e0af68",

  green          = "#9ece6a",

  teal           = "#1abc9c",
  green1         = "#73daca",
  blue6          = "#B4F9F8",

  magenta2       = "#ff007c",

  red1           = "#db4b4b",
  red            = "#f7768e",

  git            = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
  gitSigns       = { change = "#394b70", add = "#164846", delete = "#823c41" },
}
vim.cmd [[colorscheme tokyonight]]

-- Highlight yanked text
ngs.augroup("yank", {"TextYankPost * lua vim.highlight.on_yank()"})

-- Map <Leader> to <Space>
vim.g.mapleader = " "

vim.cmd [[hi MatchParen guibg=NONE gui=underline]]
