require("iris").setup({
  palettes = {
    iceberg = require("cfg.iris.iceberg"),
    tokyonight = require("cfg.iris.tokyonight"),
  },

  callbacks = {
    function (_) require("cfg.galaxyline") end,
    function (_) vim.cmd("hi MatchParen guibg=NONE gui=underline") end,
    require("cfg.iris.nvim"),
    require("cfg.iris.tmux"),
    require("cfg.iris.kitty"),
  }
})
