vim.g.nvim_tree_icons = {
  git = {
    unstaged  = "",
    staged    = "",
    unmerged  = "",
    renamed   = "",
    untracked = "",
  },
}

require("nvim-tree").setup({
  update_to_buf_dir = { enable = false },
  nvim_tree_ignore = {
    ".git",
    ".elixir_ls",
    "_build",
    "deps",
    "node_modules",
  },
})
