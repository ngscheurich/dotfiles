local colors = require("ngs.theme").colors

local modes = {
  n        = {"NORMAL",    colors.blue},
  no       = {"OPERATOR",  colors.blue},
  nov      = {"OPERATOR",  colors.blue},
  noV      = {"OPERATOR",  colors.blue},
  ["no"] = {"OPERATOR",  colors.blue},
  niI      = {"NORMAL",    colors.blue},
  niR      = {"NORMAL",    colors.blue},
  niV      = {"NORMAL",    colors.blue},
  v        = {"VISUAL",    colors.orange},
  V        = {"V-LINE",    colors.orange},
  [""]   = {"V-BLOCK",   colors.orange},
  s        = {"SELECT",    colors.yellow},
  S        = {"S-LINE",    colors.yellow},
  [""]   = {"S-BLOCK",   colors.yellow},
  i        = {"INSERT",    colors.green},
  ic       = {"COMPLETE",  colors.green},
  ix       = {"COMPLETE",  colors.green},
  R        = {"REPLACE",   colors.red},
  Rc       = {"REPLACE",   colors.red},
  Rv       = {"REPLACE",   colors.red},
  Rx       = {"REPLACE",   colors.red},
  c        = {"COMMAND",   colors.magenta},
  cv       = {"EX",        colors.magenta},
  ce       = {"EX",        colors.magenta},
  r        = {"CONTINUE?", colors.magenta},
  rm       = {"MORE...",   colors.magenta},
  ["r?"]   = {"CONFIRM?",  colors.magenta},
  ["!"]    = {"SHELL",     colors.magenta},
  t        = {"TERMINAL",  colors.magenta},
}

local vi_mode_text   = {}
local vi_mode_colors = {}

for key, val in pairs(modes) do
  vi_mode_text[key]   = val[1]
  vi_mode_colors[key] = val[2]
end

return vi_mode_text, vi_mode_colors
