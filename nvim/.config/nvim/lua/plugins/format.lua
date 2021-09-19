local astyle = "astyle --style=kr --indent-namespaces"
local black = "black"
local prettier = "npx prettier -w"
local rustfmt = "rustfmt"
local stylelint = "npx stylelint --fix"
local mix_format = "mix format"
local lua_format = function(file)
  local bufname = vim.api.nvim_buf_get_name(0)
  if not string.match(bufname, ".*/.config/nvim/.*.lua$") then
    return string.format("lua-format -i %s", file)
  end
end

require("format").setup({
  javascript = {
    {cmd = {prettier}},
  },
  typescript = {
    {cmd = {prettier}},
  },
  css = {
    {cmd = {prettier, stylelint}},
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
      cmd = {mix_format},
    },
    {
      cmd = {prettier},
      start_pattern = '~L"""',
      end_pattern = '"""'
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
}, ",")
ngs.augroup("autoformat", {string.format("BufWritePost %s FormatWrite", pat)})
