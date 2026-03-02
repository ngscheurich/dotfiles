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

  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
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
