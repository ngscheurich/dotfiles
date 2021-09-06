local colors = require("ngs.theme").colors
local lush = require("lush")
local hsl = lush.hsl

local black   = hsl(colors.black)
local white   = hsl(colors.white)
local red     = hsl(colors.red)
local orange  = hsl(colors.orange)
local yellow  = hsl(colors.yellow)
local green   = hsl(colors.green)
local cyan    = hsl(colors.cyan)
local blue    = hsl(colors.blue)
local magenta = hsl(colors.magenta)
local brown   = hsl(colors.brown)

---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- Defaults
    Normal        {fg = white, bg = black},
    CursorLine    {bg = Normal.bg.lighten(8)},
    CursorColumn  {CursorLine},
    Comment       {fg = Normal.bg.lighten(30)},
    LineNr        {bg = Normal.bg.lighten(5)},
    CursorLineNr  {fg = blue, bg = LineNr.bg},
    SignColumn    {LineNr},
    DiffAdd       {fg = green},
    DiffChange    {fg = blue},
    DiffDelete    {fg = red},
    VertSplit     {fg = SignColumn.bg, bg = Normal.bg},
    NonText       {fg = Normal.bg.lighten(20)},
    Search        {fg = Normal.bg, bg = orange},
    IncSearch     {Search},
    Visual        {bg = Normal.bg.mix(magenta, 40)},
    Pmenu         {bg = Normal.bg.lighten(10)},
    PmenuSel      {bg = Normal.bg.lighten(20)},
    PmenuSbar     {bg = Normal.bg.lighten(50)},

    -- Programming constructs
    Constant       {fg = green},
    Identifier     {fg = cyan},
    Statement      {fg = yellow},
    PreProc        {fg = magenta},
    Type           {fg = blue},
    Special        {fg = orange},

    -- LSP
    LspDiagnosticsDefaultError           { fg = red},
    LspDiagnosticsDefaultWarning         { fg = yellow},
    LspDiagnosticsDefaultInformation     { fg = cyan},
    LspDiagnosticsDefaultHint            { fg = blue},
    LspDiagnosticsVirtualTextError       { fg = LspDiagnosticsDefaultError.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultError.fg, 10)},
    LspDiagnosticsVirtualTextWarning     { fg = LspDiagnosticsDefaultWarning.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultWarning.fg, 10)},
    LspDiagnosticsVirtualTextInformation { fg = LspDiagnosticsDefaultInformation.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultInformation.fg, 10)},
    LspDiagnosticsVirtualTextHint        { fg = LspDiagnosticsDefaultHint.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultHint.fg, 10)},
    LspDiagnosticsSignError              { fg = LspDiagnosticsDefaultError.fg, bg = SignColumn.bg},
    LspDiagnosticsSignWarning            { fg = LspDiagnosticsDefaultWarning.fg, bg = SignColumn.bg},
    LspDiagnosticsSignInformation        { fg = LspDiagnosticsDefaultInformation.fg, bg = SignColumn.bg},
    LspDiagnosticsSignHint               { fg = LspDiagnosticsDefaultHint.fg, bg = SignColumn.bg},

    -- Languages

    -- Plugins
    GitSignsAdd            {fg = DiffAdd.fg, bg = SignColumn.bg},
    GitSignsChange         {fg = DiffChange.fg, bg = SignColumn.bg},
    GitSignsDelete         {fg = DiffDelete.fg, bg = SignColumn.bg},
  }
end)

return theme
