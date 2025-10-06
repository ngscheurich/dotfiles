-- Color scheme
require("ngs.util").load_theme()
vim.g.ngs.theme.apply(require("mini.base16").setup)

-- Status line
require("ngs.statusline").build()
