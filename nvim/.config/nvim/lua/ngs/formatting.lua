local astyle = "astyle --style=kr --indent-namespaces"
local black = "black"
local prettier = "npx prettier -w"
local rustfmt = "rustfmt"
local stylelint = "npx stylelint --fix"

local lua_format = function(file)
  local bufname = vim.api.nvim_buf_get_name(0)
  if string.match(bufname, ".*/.config/nvim/.*.lua$") then
    return ""
  end

  return string.format("lua-format -i %s", file)
end

require("format").setup({
  javascript = {
    {cmd = {prettier}}
  },
  typescript = {
    {cmd = {prettier}},
  },
  css = {
    {cmd = {prettier, stylelint}},
  },
  html = {
    {cmd = {prettier}},
  },
  python = {
    {cmd = {black}},
  },
  csharp = {
    {cmd = {astyle}},
  },
  rust = {
    {cmd = {rustfmt}},
  },
  lua = {
    {cmd = {lua_format}},
  },
  elixir = {
    {
      cmd = {prettier},
      start_pattern = '~L"""',
      end_pattern = '"""',
    },
  },
})

local pat = table.concat({
  "*.css",
  "*.js",
  "*.ts",
  "*.py",
  "*.cs",
  "*.rs",
  "*.lua",
  "*.ex",
  "*.exs",
  "*.html",
}, ",")

ngs.vim.augroup("autoformat", function()
  ngs.vim.autocmd("BufWritePost", pat, "FormatWrite")
end)