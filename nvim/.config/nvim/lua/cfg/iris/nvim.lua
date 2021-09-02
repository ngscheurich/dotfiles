local set = require("iris.util").set_highlight

return function(pal)
  print("nvim iris")
  require("cfg.galaxyline")

  set("Normal",       {fg = pal.fg, bg = pal.bg})
  set("LineNr",       {fg = pal.base05, bg = pal.gutter})
  set("CursorLineNr", {fg = pal.base06, bg = pal.gutter})
  set("SignColumn",   {bg = pal.gutter})
  set("CursorLine",   {bg = pal.cursorline})

  set("LspDiagnosticsSignError",       {fg = pal.error, bg = pal.gutter})
  set("LspDiagnosticsSignWarning",     {fg = pal.warn, bg = pal.gutter})
  set("LspDiagnosticsSignHint",        {fg = pal.hint, bg = pal.gutter})
  set("LspDiagnosticsSignInformation", {fg = pal.info, bg = pal.gutter})

  set("GitSignsAdd",    {fg = pal.add, bg = pal.gutter})
  set("GitSignsChange", {fg = pal.change, bg = pal.gutter})
  set("GitSignsDelete", {fg = pal.delete, bg = pal.gutter})
end
