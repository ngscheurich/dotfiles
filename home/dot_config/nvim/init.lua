vim.g.ngs = {
	theme = {
		name = "default",
		colorscheme = "default",
	},
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("ngs.core.abbrevs")
require("ngs.core.autocmds")
require("ngs.core.commands")
require("ngs.core.diagnostic")
require("ngs.core.keymaps")
require("ngs.core.lsp")
require("ngs.core.options")

require("ngs.util").load_theme()

require("ngs.lazy")
require("lazy").setup({
  spec = { { import = "ngs.specs" } },
  install = { colorscheme = { vim.g.ngs.theme.colorscheme } },
  checker = { enabled = false },
  change_detection = { notify = false },
})
