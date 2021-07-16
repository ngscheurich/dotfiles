local colors = require("iris.palette").get_color_fn

local modes = {
  n        = {"NORMAL",    colors("blue")()},
  no       = {"OPERATOR",  colors("blue")()},
  nov      = {"OPERATOR",  colors("blue")()},
  noV      = {"OPERATOR",  colors("blue")()},
  ["no"]  = {"OPERATOR",  colors("blue")()},
  niI      = {"NORMAL",    colors("blue")()},
  niR      = {"NORMAL",    colors("blue")()},
  niV      = {"NORMAL",    colors("blue")()},
  v        = {"VISUAL",    colors("orange")()},
  V        = {"V-LINE",    colors("orange")()},
  [""]    = {"V-BLOCK",   colors("orange")()},
  s        = {"SELECT",    colors("yellow")()},
  S        = {"S-LINE",    colors("yellow")()},
  [""]    = {"S-BLOCK",   colors("yellow")()},
  i        = {"INSERT",    colors("green")()},
  ic       = {"COMPLETE",  colors("green")()},
  ix       = {"COMPLETE",  colors("green")()},
  R        = {"REPLACE",   colors("red")()},
  Rc       = {"REPLACE",   colors("red")()},
  Rv       = {"REPLACE",   colors("red")()},
  Rx       = {"REPLACE",   colors("red")()},
  c        = {"COMMAND",   colors("magenta")()},
  cv       = {"EX",        colors("magenta")()},
  ce       = {"EX",        colors("magenta")()},
  r        = {"CONTINUE?", colors("magenta")()},
  rm       = {"MORE...",   colors("magenta")()},
  ["r?"]   = {"CONFIRM?",  colors("magenta")()},
  ["!"]    = {"SHELL",     colors("magenta")()},
  t        = {"TERMINAL",  colors("magenta")()},
}

return {
  {
    Mode = {
      provider = function()
        local label = "???"
        local color = colors("white")()
        local cfg = modes[vim.fn.mode()]
        if cfg then
          label = cfg[1].." "
          color = cfg[2]
        end
        vim.cmd("hi GalaxyMode guifg="..color.." guibg="..colors("line_dark")())
        vim.cmd("hi GalaxyLineColumnIcon guifg="..color)
        vim.cmd("hi GalaxyLinePercentIcon guifg="..color)
        vim.cmd("hi GalaxyGitIcon guifg="..color)
        return "▊ "..label
      end
    },
  },
}
