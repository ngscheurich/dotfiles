local colors = ngs.theme.statusline.modes

local mode_colors = {
  NORMAL = colors.normal,
  OP = colors.normal,
  INSERT = colors.insert,
  VISUAL = colors.visual,
  LINES = colors.select,
  BLOCK = colors.select,
  REPLACE = colors.replace,
  ["V-REPLACE"] = colors.replace,
  ENTER = colors.other,
  MORE = colors.other,
  SELECT = colors.other,
  COMMAND = colors.command,
  SHELL = colors.other,
  TERM = colors.other,
  NONE = colors.other,
}

return {colors = mode_colors, text = {}}
