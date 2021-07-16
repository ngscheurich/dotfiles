require("iris").setup({
  palettes = {
    tokyonight = require("config.iris.tokyonight"),
    moonfly = require("config.iris.moonfly"),
  },

  callbacks = {
    function(_) require("config.galaxyline") end,
    require("config.iris.nvim"),
    require("config.iris.tmux"),
    require("config.iris.kitty"),
  }
})
