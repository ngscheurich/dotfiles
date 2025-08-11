return {
  "EdenEast/nightfox.nvim",
  priority = 1000,

  config = function()
    local theme = vim.g.ngs.theme
    theme.apply(require("nightfox").setup)
    vim.cmd.colorscheme(theme.colorscheme)
  end,
}
