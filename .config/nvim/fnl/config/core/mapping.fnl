(module config.core.mapping
  {autoload {u config.util}})

;; Window navigation
(u.nnoremap :<Left>  :<C-W>h)
(u.nnoremap :<Down>  :<C-W>j)
(u.nnoremap :<Up>    :<C-W>k)
(u.nnoremap :<Right> :<C-W>l)

;; Window resizing
(u.nnoremap :<M-=>  "<Cmd>5wincmd +<CR>")
(u.nnoremap :<M-->  "<Cmd>5wincmd -<CR>")
(u.nnoremap :<M-.>  "<Cmd>5wincmd ><CR>")
(u.nnoremap "<M-,>" "<Cmd>5wincmd <<CR>")
 
;; Clear search highlighting on <Esc>
(u.nnoremap :<Esc> :<Cmd>nohlsearch<CR>)

;; Retain visual selection after indent
(u.vnoremap :< :<gv)
(u.vnoremap :> :>gv)
