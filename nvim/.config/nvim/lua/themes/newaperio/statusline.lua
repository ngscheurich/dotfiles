local colors = require("themes.newaperio.colors")

return {
  bg = colors.base01,
  bg_bright = colors.base02,
  bg_dim = colors.base00,
  fg = colors.base05,
  fg_dim = colors.base04,

  modes = {
    normal  = colors.base0d,
    insert  = colors.base0b,
    visual  = colors.base09,
    select  = colors.base0a,
    replace = colors.base08,
    command = colors.base0e,
  },

  git = {
    icon    = colors.base04,
    added   = colors.base0b,
    changed = colors.base0e,
    removed = colors.base08,
  },

  diagnostics = {
    errors   = colors.base08,
    warnings = colors.base0a,
    hints    = colors.base0c,
    info     = colors.base0d,
  },
}
