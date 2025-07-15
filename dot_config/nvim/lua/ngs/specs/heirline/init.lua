-- ===================================================================
--  Heirline
-- -------------------------------------------------------------------
--  https://github.com/rebelot/heirline.nvim
--  Statusline framework designed around recursive inheritance
--  ui
-- -------------------------------------------------------------------
return {
  "rebelot/heirline.nvim",

  dependencies = {
    "catppuccin/nvim",
  },

  config = function()
    local heirline = require("heirline")
    local c = require("ngs.specs.heirline.components")
    heirline.setup({
      statusline = {
        c.mode_bar,
        c.gap(2),
        c.file,
        c.gap(2),
        c.git(),
        { provider = "%=" },
        c.diagnostics,
        c.gap(2),
        c.lsp,
        c.gap(2),
        c.filetype(),
        c.gap(2),
        c.ruler,
        c.mode_tag,
      },
    })
  end,
}
