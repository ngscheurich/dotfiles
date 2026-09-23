Config.now_if_args(function()
  vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

  Config.on_packchanged(
    "nvim-treesitter",
    { "update" },
    vim.cmd.TSUpdate,
    "Update Tree-sitter"
  )

  local languages = {
    "bash",
    "css",
    "elixir",
    "erlang",
    "fennel",
    "gdscript",
    "gleam",
    "go",
    "graphql",
    "heex",
    "html",
    "http",
    "javascript",
    "json",
    "kdl",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "python",
    "rust",
    "scss",
    "sql",
    "svelte",
    "typescript",
    "vimdoc",
    "xml",
    "yaml",
  }

  -- A language needs both a parser and its queries; installs can leave one
  -- behind, so check for each rather than assuming a parser implies queries.
  local isnt_installed = function(lang)
    local has = function(pat)
      return #vim.api.nvim_get_runtime_file(pat, false) > 0
    end
    return not has("parser/" .. lang .. ".*")
      or not has("queries/" .. lang .. "/highlights.scm")
  end

  local to_install = vim.tbl_filter(isnt_installed, languages)

  if #to_install > 0 then require("nvim-treesitter").install(to_install) end

  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end

  local ts_start = function(ev) vim.treesitter.start(ev.buf) end

  Config.autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)
