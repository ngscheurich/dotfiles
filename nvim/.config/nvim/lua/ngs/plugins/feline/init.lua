local colors = require("ngs.theme").colors
local comps = require("config.feline.components")
local vi_mode_text, vi_mode_colors = require("config.feline.modes")

local components = {
  left =  {
    active = {
      comps.file.info,
      comps.git.branch,
      comps.git.added,
      comps.git.changed,
      comps.git.removed,
    },
    inactive = {},
  },
  mid = {
    active = {},
    inactive = {},
  },
  right = {
    active = {
      comps.diagnostics.errors,
      comps.diagnostics.warnings,
      comps.diagnostics.hints,
      comps.diagnostics.info,
      comps.file.type,
      comps.position.cursor,
      comps.position.byte,
    },
    inactive = {},
  },
}

require("feline").setup({
  default_bg = colors.grey,
  default_fg = colors.white,
  vi_mode_text = vi_mode_text,
  vi_mode_colors = vi_mode_colors,
  components = components,
  -- properties = {},
})
