require("iris").setup({
  -- palettes = {
  --   iceberg = require("config.iris.iceberg"),
  --   tokyonight = require("cfg.iris.tokyonight"),
  -- },
  palettes = {},

  callbacks = {
    -- function (_) require("cfg.galaxyline") end,
    -- function (_) vim.cmd("hi MatchParen guibg=NONE gui=underline") end,
    -- require("plugins.iris.nvim"),
    require("plugins.iris.tmux"),
    require("plugins.iris.kitty"),
  }
})
