(module config.plugin.tree
  {autoload {tree nvim-tree
             u config.util}})

(set vim.g.nvim_tree_icons
     {:git {:unstaged ""
            :staged    ""
            :unmerged  ""
            :renamed   ""
            :untracked "" }})

(tree.setup
  {:update_to_buf_dir {:enable false}
   :nvim_tree_ignore [".git"
                      ".elixir_ls"
                      "_build"
                      "deps"
                      "node_modules"]})

(u.nnoremap :<Leader>ee :<Cmd>NvimTreeToggle<CR>)
(u.nnoremap :<Leader>ef :<Cmd>NvimTreeFindFile<CR>)
