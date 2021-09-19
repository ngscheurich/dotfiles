local lighten = require("iris.lib.color").lighten

local function palette_colors(pal)
  local lighten_amt = 0.7

  local colors = {
    foreground = pal.fg,
    background = pal.bg,
    color0     = pal.black,
    color1     = pal.red,
    color2     = pal.green,
    color3     = pal.yellow,
    color4     = pal.blue,
    color5     = pal.magenta,
    color6     = pal.cyan,
    color7     = pal.white,
    color8     = lighten(pal.black, lighten_amt),
    color9     = lighten(pal.red, lighten_amt),
    color10    = lighten(pal.green,  lighten_amt),
    color11    = lighten(pal.yellow, lighten_amt),
    color12    = lighten(pal.blue, lighten_amt),
    color13    = lighten(pal.magenta, lighten_amt),
    color14    = lighten(pal.cyan, lighten_amt),
    color15    = lighten(pal.white, lighten_amt),
  }

  local colorstr = ""
  for key, val in pairs(colors) do
    colorstr = string.format("%s %s=%s", colorstr, key, val)
  end

  return colorstr
end

return function(pal)
  local colorscheme = vim.g.colors_name

  local path = string.format("/Users/nick/.config/kitty/colors/%s.conf",
    colorscheme)
  local arg = ""

  local job = vim.loop.new_async(vim.schedule_wrap(function()
    if vim.loop.fs_access(path, "R") then
      arg = path
    else
      arg = palette_colors(pal)
    end

    local socket = "unix:/tmp/kittysocket"
    local cmd = string.format("kitty @ --to=%s set-colors %s", socket, arg)

    vim.fn.system(cmd)
  end))

  job:send()
end
