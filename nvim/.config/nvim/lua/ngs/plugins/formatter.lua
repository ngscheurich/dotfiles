local function bufname() return vim.api.nvim_buf_get_name(0) end
local tempfile_dir = "/tmp"

local formatters = {
  mix_format = {
    function()
      return {
        exe = "mix",
        args = {"format"},
        stdin = false,
        tempfile_dir = tempfile_dir,
      }
    end,
  },
  prettier = {
    function()
      return {
        exe = "npx",
        args = {"prettier", "--stdin-filepath", bufname()},
        stdin = true,
      }
    end,
  },
  lua_formatter = {
    function()
      if string.match(bufname(), ".*/.config/nvim/.*.lua$") then
        return {
          exe = "cat",
          stdin = false,
          tempfile_dir = tempfile_dir,
        }
      end
      return {
        exe = "lua-format",
        args = {"-i"},
        stdin = false,
        tempfile_dir = tempfile_dir,
      }
    end,
  },
  rustfmt = {
    function()
      return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
    end,
  },
  astyle = {
    function()
      return {
        exe = "astyle",
        args = {"--style=kr", "--indent-namespaces"},
        stdin = true,
      }
    end,
  },
  black = {function() return {exe = "black", args = {"-"}, stdin = true} end},
}

require("formatter").setup({
  filetype = {
    elixir          = formatters.mix_format,
    typescript      = formatters.prettier,
    typescriptreact = formatters.prettier,
    javascript      = formatters.prettier,
    html            = formatters.prettier,
    eelixir         = formatters.prettier,
    markdown        = formatters.prettier,
    css             = formatters.prettier,
    graphql         = formatters.prettier,
    yaml            = formatters.prettier,
    lua             = formatters.lua_formatter,
    rust            = formatters.rustfmt,
    c               = formatters.astyle,
    cs              = formatters.astyle,
    cpp             = formatters.astyle,
    python          = formatters.black,
  },
})

local pat = table.concat({
  "*.ex", "*.exs", "*.ts", "*.tsx", "*.js", "*.html", "*.md", "*.markdown",
  "*.css", "*.lua", "*.graphql", "*.gql", "*.yaml", "*.c", "*.cs", "*.cpp",
  "*.py",
}, ",")
_G.ngs.augroup("autoformat", {string.format("BufWritePost %s FormatWrite", pat)})
