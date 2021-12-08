(module config.pacakge.test
  {autoload {u config.util}})

(u.nnoremap :<Leader>tf :<Cmd>TestFile<CR>)
(u.nnoremap :<Leader>tl :<Cmd>TestLast<CR>)
(u.nnoremap :<Leader>tn :<Cmd>TestNearest<CR>)
(u.nnoremap :<Leader>ts :<Cmd>TestSuite<CR>)
(u.nnoremap :<Leader>tv :<Cmd>TestVisit<CR>)
