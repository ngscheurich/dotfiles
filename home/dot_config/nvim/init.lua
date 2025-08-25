vim.g.ngs = {
  theme = {
    name = "default",
    palette = {},
    apply = function(_) end,
  },
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("ngs.util").load_theme()
