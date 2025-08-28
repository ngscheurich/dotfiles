vim.g.ngs = {
  theme = {
    apply = function(_) end,
  },
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.cmdheight = 0

require("vim._extui").enable({ enable = true, msg = { target = "cmd", timeout = 4000 } })

require("ngs.bootstrap")
