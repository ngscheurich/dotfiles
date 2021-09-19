local colors = require("themes.base16.colors")

return {
  bg = colors.base01,
  bg_bright = colors.base02,
  bg_dim = colors.base00,
  fg = colors.base05,
  fg_dim = colors.base04,

  modes = {
    normal = colors.base0D,
    insert = colors.base0B,
    visual = colors.base09,
    select = colors.base0A,
    replace = colors.base08,
    command = colors.base0F,
    other = colors.base04,
  },

  git = {
    icon = colors.base04,
    added = colors.base0B,
    changed = colors.base0E,
    removed = colors.base08,
  },

  diagnostics = {
    errors = colors.base08,
    warnings = colors.base0A,
    hints = colors.base0C,
    info = colors.base0D,
  },
}
