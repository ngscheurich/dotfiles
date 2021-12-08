(module config.plugin.gitsigns
  {autoload {gitsigns gitsigns
             u config.util}})

(gitsigns.setup
  {:signs {:add         {:text :┃}
          :change       {:text :┃}
          :delete       {:text :┃}
          :topdelete    {:text :┃}
          :changedelete {:text :┃}}})

(u.nnoremap "]c" "<Cmd>Gitsigns next_hunk<CR> ")
(u.nnoremap "[c" "<Cmd>Gitsigns prev_hunk<CR> ")
(u.nnoremap :<Leader>gb "<Cmd>Gitsigns toggle_current_line_blame<CR>")
(u.nnoremap :<Leader>gp "<Cmd>Gitsigns preview_hunk<CR>")
(u.nnoremap :<Leader>gr "<Cmd>Gitsigns reset_hunk<CR>")
(u.onoremap :ih "<Cmd>Gitsigns select_hunk<CR>")
(u.xnoremap :ih "<Cmd>Gitsigns select_hunk<CR>")
