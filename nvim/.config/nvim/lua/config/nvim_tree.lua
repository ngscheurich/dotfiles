vim.g.nvim_tree_ignore = {
  '.git',
  '.elixir_ls',
  '_build',
  'deps',
  'node_modules',
}

vim.g.nvim_tree_icons = {
  git = {
    unstaged  = '',
    staged    = '',
    unmerged  = '',
    renamed   = '',
    untracked = '',
  },
}

ngs.nnoremap("<Leader>ee", "<Cmd>NvimTreeToggle<CR>")
ngs.nnoremap("<Leader>ef", "<Cmd>NvimTreeFindFile<CR>")
