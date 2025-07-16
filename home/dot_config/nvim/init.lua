vim.g.ngs = {
	theme = {
		name = "default",
		colorscheme = "default",
	},
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.lsp.enable({ "lexical", "lua_ls", "nil", "typescript_ls" })

require("ngs.core.abbrevs")
require("ngs.core.autocmds")
require("ngs.core.diag")
require("ngs.core.keymaps")
require("ngs.core.options")
require("ngs.core.usercmds")

require("ngs.util").load_theme()

require("ngs.lazy")
require("lazy").setup({
	spec = { { import = "ngs.specs" } },
	install = { colorscheme = { vim.g.ngs.theme.colorscheme } },
	checker = { enabled = true },
	change_detection = { notify = false },
})
