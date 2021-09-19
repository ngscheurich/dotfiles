---@diagnostic disable: undefined-global
---@diagnostic disable: unused-local
local lush = require("lush")
local hsl = lush.hsl

local colors = require("themes.base16.colors")

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
local base0A = hsl(colors.base0A)
local base0B = hsl(colors.base0B)
local base0C = hsl(colors.base0C)
local base0D = hsl(colors.base0D)
local base0E = hsl(colors.base0E)
local base0F = hsl(colors.base0F)

-- LuaFormatter off
local spec = lush(function()
  return {
    -- Defaults
    ColorColumn  {bg = base01};
    Comment      {fg = base03};
    Conceal      {fg = base00, bg = base00};
    Cursor       {fg = base00, bg = base05};
    CursorColumn {bg = base01.darken(5)};
    CursorLine   {CursorColumn};
    CursorLineNr {fg = base04, bg = base01.darken(20)};
    DiffAdd      {fg = base0B};
    DiffChange   {fg = base0E};
    DiffDelete   {fg = base08};
    DiffText     {fg = base0E};
    Directory    {fg = base0D};
    EndOfBuffer  {fg = base03};
    ErrorMsg     {fg = base08, bg = base00};
    FoldColumn   {fg = base0C, bg = base01};
    Folded       {fg = base03, bg = base01};
    IncSearch    {fg = base01, bg = base09};
    LineNr       {fg = base04, bg = CursorLineNr.bg};
    MatchParen   {bg = base03};
    ModeMsg      {fg = base0B};
    MoreMsg      {ModeMsg};
    NonText      {fg = base03};
    Normal       {fg = base05.darken(1), bg = base00.lighten(1)};
    NormalFloat  {Normal};
    NormalNC     {Normal};
    PMenu        {fg = Normal.fg, bg = base01};
    PmenuSbar    {fg = base0F};
    PMenuSel     {fg = base01, bg = base04};
    PmenuThumb   {fg = base08};
    Question     {fg = base0D};
    QuickFixLine {bg = base01};
    Search       {fg = base01, bg = base0A};
    SignColumn   {LineNr};
    SpecialKey   {fg = base03};
    SpellBad     {fg = base08, gui = "underline"};
    SpellCap     {fg = base0F};
    SpellLocal   {fg = base0F};
    SpellRare    {fg = base0F};
    StatusLine   {fg = base04, bg = base02};
    StatusLineNC {fg = base03, bg = base01};
    Substitute   {Search};
    TabLine      {fg = base03, bg = base01};
    TabLineFill  {TabLine};
    TabLineSel   {fg = base0B, bg = TabLine.bg};
    TermCursor   {Cursor};
    TermCursorNC {fg = Cursor.fg, bg= Cursor.bg.darken(30)};
    Title        {fg = base0D};
    VertSplit    {fg = base02, bg = base02};
    Visual       {bg = base02};
    VisualNOS    {fg = base08};
    WarningMsg   {fg = base08};
    Whitespace   {fg = Normal.fg.darken(40)};
    WildMenu     {fg = base08, bg = base0A};
    lCursor      {Cursor};

    -- Programming constructs
    Constant       {fg = base09};
    String         {fg = base0B};
    Character      {fg = base08};
    Number         {Constant};
    Boolean        {Constant};
    Float          {Constant};

    Identifier     {fg = base08};
    Function       {fg = base0D};

    Statement      {fg = base08};
    Conditional    {fg = base0E};
    Repeat         {fg = base0A};
    Label          {fg = base0A};
    Operator       {fg = base05};
    Keyword        {fg = base0E};
    Exception      {fg = base08};

    PreProc        {fg = base0A};
    Include        {fg = base0D};
    Define         {fg = base0E, gui = "bold"};
    Macro          {fg = base08};
    PreCondit      {fg = base0D};

    Type           {fg = base0A};
    StorageClass   {Type};
    Structure      {fg = base0E};
    Typedef        {Type};

    Special        {fg = base0C};
    SpecialChar    {fg = base0F};
    Tag            {fg = base0A};
    Delimiter      {fg = base0F};
    SpecialComment {fg = Comment.fg.lighten(40)};
    Debug          {fg = base08};

    Underlined     {gui = "underline" };
    Bold           {gui = "bold" };
    Italic         {gui = "italic" };

    Ignore         {Conceal};

    Error          {Exception};

    Todo           {fg = base0A, bg = base01};

    -- Languages
		elixirArguments		   {fg = Normal.fg.darken(10)};
    elixirBlock          {Delimiter};
    elixirOperator       {fg = base0F.lighten(40)};
    elixirListDelimiter  {Delimiter};
    elixirMapDelimiter   {Delimiter};
    elixirTupleDelimiter {Delimiter};

    -- LSP
    LspDiagnosticsDefaultError           {fg = base08};
    LspDiagnosticsDefaultWarning         {fg = base0A};
    LspDiagnosticsDefaultInformation     {fg = base0C};
    LspDiagnosticsDefaultHint            {fg = base0D};

    LspDiagnosticsVirtualTextError       {fg = LspDiagnosticsDefaultError.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultError.fg, 10)};
    LspDiagnosticsVirtualTextWarning     {fg = LspDiagnosticsDefaultWarning.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultWarning.fg, 10)};
    LspDiagnosticsVirtualTextInformation {fg = LspDiagnosticsDefaultInformation.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultInformation.fg, 10)};
    LspDiagnosticsVirtualTextHint        {fg = LspDiagnosticsDefaultHint.fg, bg = Normal.bg.mix(LspDiagnosticsDefaultHint.fg, 10)};

    LspDiagnosticsSignError              {fg = LspDiagnosticsDefaultError.fg, bg = SignColumn.bg};
    LspDiagnosticsSignWarning            {fg = LspDiagnosticsDefaultWarning.fg, bg = SignColumn.bg};
    LspDiagnosticsSignInformation        {fg = LspDiagnosticsDefaultInformation.fg, bg = SignColumn.bg};
    LspDiagnosticsSignHint               {fg = LspDiagnosticsDefaultHint.fg, bg = SignColumn.bg};

    -- Treesitter
    TSSymbol             {Keyword};

    -- Plugins
    GitSignsAdd            {fg = DiffAdd.fg, bg = SignColumn.bg};
    GitSignsChange         {fg = DiffChange.fg, bg = SignColumn.bg};
    GitSignsDelete         {fg = DiffDelete.fg, bg = SignColumn.bg};
  }
end)
-- LuaFormatter on

return spec
