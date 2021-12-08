(module config.plugin.telescope
  {autoload {u config.util}})

(u.nnoremap :<Leader>ff "<Cmd>Telescope find_files<CR>")
(u.nnoremap :<Leader>fg "<Cmd>Telescope live_grep<CR>")
(u.nnoremap :<Leader>fb "<Cmd>Telescope buffers<CR>")
(u.nnoremap :<Leader>fh "<Cmd>Telescope help_tags<CR>")
(u.nnoremap :<Leader>fr "<Cmd>Telescope registers<CR>")
(u.nnoremap :<Leader>ft "<Cmd>Telescope treesitter<CR>")
