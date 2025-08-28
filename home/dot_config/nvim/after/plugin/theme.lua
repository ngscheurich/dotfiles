-- Color scheme
require("ngs.util").load_theme()
vim.g.ngs.theme.apply(require("nightfox").setup)

-- Status line
require("ngs.statusline").build()
