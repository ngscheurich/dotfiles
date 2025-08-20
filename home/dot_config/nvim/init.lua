vim.g.ngs = {
  theme = {
    name = "default",
    colorscheme = "default",
  },
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("ngs.util").load_theme()

vim.diagnostic.config({
  signs = {
    text = {
      ["vim.diagnostic.severity.ERROR"] = "",
      ["vim.diagnostic.severity.WARN"] = "",
      ["vim.diagnostic.severity.INFO"] = "",
      ["vim.diagnostic.severity.HINT"] = "",
    },
  },
})

require("ngs.lazy")
require("lazy").setup({
  spec = { { import = "ngs.specs" } },
  install = { colorscheme = { vim.g.ngs.theme.colorscheme } },
  checker = { enabled = false },
  change_detection = { notify = false },
})
