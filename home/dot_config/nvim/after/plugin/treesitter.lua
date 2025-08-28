-- nvim-treesitter
local tsconfig_ok, tsconfig = pcall(require, "nvim-treesitter.config")
if tsconfig_ok then
  ---@diagnostic disable-next-line
  tsconfig.setup({
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
end
