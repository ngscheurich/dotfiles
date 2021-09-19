local astyle = "astyle --style=kr --indent-namespaces"
local black = "black"
local prettier = "npx prettier -w"
local rustfmt = "rustfmt"
local stylelint = "npx stylelint --fix"
-- local lua_format = "lua-format -i"

require("format").setup({
  css = {{cmd = {prettier, stylelint}}},
  javascript = {{cmd = {prettier}}},
  typescript = {{cmd = {prettier}}},
  python = {{cmd = {black}}},
  csharp = {{cmd = {astyle}}},
  rust    = {{cmd = {rustfmt}}},
  lua = {
    {
      cmd = {
        function(file)
          local bufname = vim.api.nvim_buf_get_name(0)
          if not string.match(bufname, ".*/.config/nvim/.*.lua$") then
            print(file)
            return string.format("lua_format -i %s", file)
          end
        end,
      },
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
}, ",")
ngs.augroup("autoformat", {string.format("BufWritePost %s FormatWrite", pat)})
