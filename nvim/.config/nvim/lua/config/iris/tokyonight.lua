local exists, module = pcall(require, "tokyonight.colors")
if not exists then return end

local blend = require("iris.lib.color").blend

vim.g.tokyonight_style = "night"
local colors = module.setup()

return {
  fg         = colors.fg,
  bg         = colors.bg,
  base00     = colors.bg,
  base01     = colors.bg_dark,
  base02     = colors.bg_highlight,
  base03     = colors.bg_highlight,
  base04     = colors.fg_gutter,
  base05     = colors.comment,
  base06     = colors.fg_dark,
  base07     = colors.fg,
  base08     = colors.red,
  base09     = colors.orange,
  base0A     = colors.yellow,
  base0B     = colors.teal,
  base0C     = colors.cyan,
  base0D     = colors.blue,
  base0E     = colors.magenta,
  base0F     = colors.git.delete,
  gutter     = colors.bg_dark,
  cursorline = blend(colors.bg_dark, colors.fg_gutter, 0.9),
  add        = colors.gitSigns.add,
  change     = colors.gitSigns.change,
  delete     = colors.gitSigns.delete,
}
