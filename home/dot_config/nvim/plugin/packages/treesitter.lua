-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  nvim-treesitter                                │  treesitter         │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Tree-sitter configurations and abstraction layer                      │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add({
    source = "https://github.com/nvim-treesitter/nvim-treesitter",
    checkout = "master",
    monitor = "main",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })

  local tsconfigs = require("nvim-treesitter.configs")

  ---@diagnostic disable-next-line
  tsconfigs.setup({
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
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
    },
  })
end)
