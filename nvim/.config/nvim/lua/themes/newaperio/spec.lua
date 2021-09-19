---@diagnostic disable: undefined-global
---@diagnostic disable: unused-local

local lush = require("lush")
local hsl = lush.hsl

local colors = require("themes.newaperio.colors")

local base00 = hsl(colors.base00)
local base01 = hsl(colors.base01)
local base02 = hsl(colors.base02)
local base03 = hsl(colors.base03)
local base04 = hsl(colors.base04)
local base05 = hsl(colors.base05)
local base06 = hsl(colors.base06)
local base07 = hsl(colors.base07)
local base08 = hsl(colors.base08)
local base09 = hsl(colors.base09)
local base0a = hsl(colors.base0a)
local base0b = hsl(colors.base0b)
local base0c = hsl(colors.base0c)
local base0d = hsl(colors.base0d)
local base0e = hsl(colors.base0e)
local base0f = hsl(colors.base0f)

local spec = lush(function()
  return {
    -- Builtins
    Normal        {fg = base05, bg = base00},
    Comment       {fg = Normal.bg.lighten(20)},
    CursorLine    {bg = base01},
    CursorColumn  {CursorLine},
    DiffAdd       {fg = base0b},
    DiffChange    {fg = base0e},
    DiffDelete    {fg = base08},
    Directory     {fg = base0d},
    LineNr        {fg = base04, bg = base01.darken(20)},
    CursorLineNr  {fg = base04, bg = LineNr.bg},
    MatchParen    {fg = base08, bg = Normal.bg},
    NonText       {fg = base01},
    Pmenu         {bg = base02},
    PmenuSbar     {bg = base04},
    PmenuSel      {bg = base03},
    Search        {fg = base01, bg = base0a},
    IncSearch     {Search},
    SignColumn    {LineNr},
    VertSplit     {fg = SignColumn.bg, bg = Normal.bg},
    Visual        {bg = base02},

    -- Programming constructs
    Constant       {fg = base09},
    String         {fg = base0b},
    Character      {fg = base08},
    Number         {Constant},
    Boolean        {Constant},
    Float          {Constant},

    Identifier     {fg = base0d},
    Function       {Identifier},

    Statement      {fg = base08},
    Conditional    {fg = base0d},
    Repeat         {fg = base0a},
    Label          {fg = base0a},
    Operator       {fg = base05},
    Keyword        {fg = base0e},
    Exception      {fg = base08},

    PreProc        {fg = base0a},

    Type           {fg = base0a},
    StorageClass   {Type},
    Structure      {Type},
    Typedef        {Type},

    Special        {fg = base0c},

    -- Languages

    -- Treesitter
    TSFunction     {fg = base0a},
    TSField        {fg = base0e},

    -- LSP
    LspDiagnosticsDefaultError           {fg = base08.darken(30)},
    LspDiagnosticsDefaultWarning         {fg = base0a.darken(20)},
    LspDiagnosticsDefaultInformation     {fg = base0e.darken(20)},
    LspDiagnosticsDefaultHint            {fg = base0c},
    LspDiagnosticsVirtualTextError       {fg = LspDiagnosticsDefaultError.fg, bg = LspDiagnosticsDefaultError.fg.mix(Normal.bg, 90)},
    LspDiagnosticsVirtualTextWarning     {fg = LspDiagnosticsDefaultWarning.fg, bg = LspDiagnosticsDefaultWarning.fg.mix(Normal.bg, 90)},
    LspDiagnosticsVirtualTextInformation {fg = LspDiagnosticsDefaultInformation.fg, bg = LspDiagnosticsDefaultInformation.fg.mix(Normal.bg, 90)},
    LspDiagnosticsVirtualTextHint        {fg = LspDiagnosticsDefaultHint.fg, bg = LspDiagnosticsDefaultHint.fg.mix(Normal.bg, 90)},
    LspDiagnosticsSignError              {fg = LspDiagnosticsDefaultError.fg, bg = SignColumn.bg},
    LspDiagnosticsSignWarning            {fg = LspDiagnosticsDefaultWarning.fg, bg = SignColumn.bg},
    LspDiagnosticsSignInformation        {fg = LspDiagnosticsDefaultInformation.fg, bg = SignColumn.bg},
    LspDiagnosticsSignHint               {fg = LspDiagnosticsDefaultHint.fg, bg = SignColumn.bg},

    -- Plugins
    GitSignsAdd            {fg = DiffAdd.fg, bg = SignColumn.bg},
    GitSignsChange         {fg = DiffChange.fg, bg = SignColumn.bg},
    GitSignsDelete         {fg = DiffDelete.fg, bg = SignColumn.bg},
  }
end)

return spec
