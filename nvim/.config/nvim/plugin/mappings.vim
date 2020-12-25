" Map <Leader> to <Space>
let mapleader = ' '

" Navigate window splits with the arrow keys
nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l

" Clear search highlighting on <Esc>
nnoremap <Esc> <Cmd>nohlsearch<CR>

" Replace word under the cursor, by buffer or line
nnoremap <Leader>rb <Cmd>%s/\\<<C-r><C-w>\\>/
nnoremap <Leader>rl <Cmd>s/\\<<C-r><C-w>\\>/

" Yank until the end of the line
nnoremap Y y$

" Close the quickfix or location list
nnoremap <Leader>cc <Cmd>cclose<CR>
nnoremap <Leader>cl <Cmd>lclose<CR>

" Window managemnet
nnoremap <Leader>wq <Cmd>q<CR>
nnoremap <Leader>ws <Cmd>split<CR>
nnoremap <Leader>wv <Cmd>vsplit<CR>

" Buffer management
nnoremap <Leader>bd <Cmd>bdelete<CR>
nnoremap <Leader>bh <Cmd>Startify<CR>
nnoremap <Leader>bn <Cmd>bnext<CR>
nnoremap <Leader>bp <Cmd>bprevious<CR>