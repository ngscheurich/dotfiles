-- ===================================================================
--  nvim-treesitter
-- -------------------------------------------------------------------
--  https://github.com/nvim-treesitter/nvim-treesitter
--  Tree-sitter configurations and abstraction layer
--  tree-sitter
-- -------------------------------------------------------------------
MiniDeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  monitor = "main",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

require("nvim-treesitter.configs").setup({
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
