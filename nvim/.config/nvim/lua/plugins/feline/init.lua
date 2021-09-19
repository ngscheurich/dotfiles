local colors = ngs.theme.statusline
local comps = require("plugins.feline.components")
local mode = require("plugins.feline.mode")

local components = {
  left =  {
    active = {
      comps.mode,
      comps.file.info,
      comps.git.branch,
      comps.git.added,
      comps.git.changed,
      comps.git.removed,
    },
    inactive = {
      comps.file.info_inactive,
    },
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
  default_fg = colors.fg,
  default_bg = colors.bg,
  vi_mode_text = mode.text,
  vi_mode_colors = mode.colors,
  components = components,
  -- properties = {},
})
