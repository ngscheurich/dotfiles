let s:cpo_save=&cpo
set cpo&vim
noremap! <M-C-H> 
noremap! <M-C-H> 
noremap! <M-BS> 
noremap! <M-p> <Up>
noremap! <M-n> <Down>
cnoremap <M-d> <S-Right>
inoremap <M-d> dw
noremap! <M-f> <S-Right>
noremap! <M-b> <S-Left>
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Right>"
inoremap <expr> <C-F> col('.')>strlen(getline('.'))?"\<C-F>":"\<Right>"
inoremap <expr> <C-E> col('.')>strlen(getline('.'))||pumvisible()?"\<C-E>":"\<End>"
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<C-D>":"\<Del>"
inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<C-D>":"\<Del>"
cnoremap <C-B> <Left>
inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<C-D>\<Esc>kJs":"\<Left>"
cnoremap <C-X><C-A> 
cnoremap <C-A> <Home>
inoremap <C-X><C-A> 
inoremap <C-A> ^
inoremap <silent> <expr> <BS> v:lua.MiniPairs.bs()
inoremap <C-W> u
inoremap <C-U> u
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap <silent>  <Cmd>lua MiniBracketed.register_undo_state()
nmap  d
nnoremap  
nnoremap  <Cmd>nohlsearch
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap - <Cmd>Oil
xnoremap <silent> <expr> @ mode() ==# 'V' ? ':normal! @'.getcharstr().'' : '@'
xnoremap <silent> <expr> Q mode() ==# 'V' ? ':normal! @=reg_recorded()' : 'Q'
nnoremap Y y$
nnoremap <silent> [y <Cmd>lua MiniBracketed.yank('backward')
nnoremap <silent> [Y <Cmd>lua MiniBracketed.yank('first')
nnoremap <silent> [w <Cmd>lua MiniBracketed.window('backward')
nnoremap <silent> [W <Cmd>lua MiniBracketed.window('first')
nnoremap <silent> [u <Cmd>lua MiniBracketed.undo('backward')
nnoremap <silent> [U <Cmd>lua MiniBracketed.undo('first')
onoremap <silent> [t v<Cmd>lua MiniBracketed.treesitter('backward')
xnoremap <silent> [t <Cmd>lua MiniBracketed.treesitter('backward')
onoremap <silent> [T v<Cmd>lua MiniBracketed.treesitter('first')
xnoremap <silent> [T <Cmd>lua MiniBracketed.treesitter('first')
nnoremap <silent> [o <Cmd>lua MiniBracketed.oldfile('backward')
nnoremap <silent> [O <Cmd>lua MiniBracketed.oldfile('first')
onoremap <silent> [j v<Cmd>lua MiniBracketed.jump('backward')
nnoremap <silent> [j <Cmd>lua MiniBracketed.jump('backward')
onoremap <silent> [J v<Cmd>lua MiniBracketed.jump('first')
nnoremap <silent> [J <Cmd>lua MiniBracketed.jump('first')
onoremap <silent> [i V<Cmd>lua MiniBracketed.indent('backward')
xnoremap <silent> [i <Cmd>lua MiniBracketed.indent('backward')
nnoremap <silent> [i <Cmd>lua MiniBracketed.indent('backward')
onoremap <silent> [I V<Cmd>lua MiniBracketed.indent('first')
xnoremap <silent> [I <Cmd>lua MiniBracketed.indent('first')
nnoremap <silent> [I <Cmd>lua MiniBracketed.indent('first')
nnoremap <silent> [f <Cmd>lua MiniBracketed.file('backward')
nnoremap <silent> [F <Cmd>lua MiniBracketed.file('first')
onoremap <silent> [d v<Cmd>lua MiniBracketed.diagnostic('backward')
xnoremap <silent> [d <Cmd>lua MiniBracketed.diagnostic('backward')
onoremap <silent> [D v<Cmd>lua MiniBracketed.diagnostic('first')
xnoremap <silent> [D <Cmd>lua MiniBracketed.diagnostic('first')
onoremap <silent> [x V<Cmd>lua MiniBracketed.conflict('backward')
xnoremap <silent> [x <Cmd>lua MiniBracketed.conflict('backward')
nnoremap <silent> [x <Cmd>lua MiniBracketed.conflict('backward')
onoremap <silent> [X V<Cmd>lua MiniBracketed.conflict('first')
xnoremap <silent> [X <Cmd>lua MiniBracketed.conflict('first')
nnoremap <silent> [X <Cmd>lua MiniBracketed.conflict('first')
onoremap <silent> [c V<Cmd>lua MiniBracketed.comment('backward')
xnoremap <silent> [c <Cmd>lua MiniBracketed.comment('backward')
nnoremap <silent> [c <Cmd>lua MiniBracketed.comment('backward')
onoremap <silent> [C V<Cmd>lua MiniBracketed.comment('first')
xnoremap <silent> [C <Cmd>lua MiniBracketed.comment('first')
nnoremap <silent> [C <Cmd>lua MiniBracketed.comment('first')
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap <silent> [B <Cmd>lua MiniBracketed.buffer('first')
nnoremap <silent> [b <Cmd>lua MiniBracketed.buffer('backward')
nnoremap <silent> [T <Cmd>lua MiniBracketed.treesitter('first')
nnoremap <silent> [t <Cmd>lua MiniBracketed.treesitter('backward')
nnoremap <silent> [L <Cmd>lua MiniBracketed.location('first')
nnoremap <silent> [l <Cmd>lua MiniBracketed.location('backward')
nnoremap <silent> [Q <Cmd>lua MiniBracketed.quickfix('first')
nnoremap <silent> [q <Cmd>lua MiniBracketed.quickfix('backward')
nnoremap <silent> [D <Cmd>lua MiniBracketed.diagnostic('first')
nnoremap <silent> [d <Cmd>lua MiniBracketed.diagnostic('backward')
nnoremap <silent> ]y <Cmd>lua MiniBracketed.yank('forward')
nnoremap <silent> ]Y <Cmd>lua MiniBracketed.yank('last')
nnoremap <silent> ]w <Cmd>lua MiniBracketed.window('forward')
nnoremap <silent> ]W <Cmd>lua MiniBracketed.window('last')
nnoremap <silent> ]u <Cmd>lua MiniBracketed.undo('forward')
nnoremap <silent> ]U <Cmd>lua MiniBracketed.undo('last')
onoremap <silent> ]t v<Cmd>lua MiniBracketed.treesitter('forward')
xnoremap <silent> ]t <Cmd>lua MiniBracketed.treesitter('forward')
onoremap <silent> ]T v<Cmd>lua MiniBracketed.treesitter('last')
xnoremap <silent> ]T <Cmd>lua MiniBracketed.treesitter('last')
nnoremap <silent> ]o <Cmd>lua MiniBracketed.oldfile('forward')
nnoremap <silent> ]O <Cmd>lua MiniBracketed.oldfile('last')
onoremap <silent> ]j v<Cmd>lua MiniBracketed.jump('forward')
nnoremap <silent> ]j <Cmd>lua MiniBracketed.jump('forward')
onoremap <silent> ]J v<Cmd>lua MiniBracketed.jump('last')
nnoremap <silent> ]J <Cmd>lua MiniBracketed.jump('last')
onoremap <silent> ]i V<Cmd>lua MiniBracketed.indent('forward')
xnoremap <silent> ]i <Cmd>lua MiniBracketed.indent('forward')
nnoremap <silent> ]i <Cmd>lua MiniBracketed.indent('forward')
onoremap <silent> ]I V<Cmd>lua MiniBracketed.indent('last')
xnoremap <silent> ]I <Cmd>lua MiniBracketed.indent('last')
nnoremap <silent> ]I <Cmd>lua MiniBracketed.indent('last')
nnoremap <silent> ]f <Cmd>lua MiniBracketed.file('forward')
nnoremap <silent> ]F <Cmd>lua MiniBracketed.file('last')
onoremap <silent> ]d v<Cmd>lua MiniBracketed.diagnostic('forward')
xnoremap <silent> ]d <Cmd>lua MiniBracketed.diagnostic('forward')
onoremap <silent> ]D v<Cmd>lua MiniBracketed.diagnostic('last')
xnoremap <silent> ]D <Cmd>lua MiniBracketed.diagnostic('last')
onoremap <silent> ]x V<Cmd>lua MiniBracketed.conflict('forward')
xnoremap <silent> ]x <Cmd>lua MiniBracketed.conflict('forward')
nnoremap <silent> ]x <Cmd>lua MiniBracketed.conflict('forward')
onoremap <silent> ]X V<Cmd>lua MiniBracketed.conflict('last')
xnoremap <silent> ]X <Cmd>lua MiniBracketed.conflict('last')
nnoremap <silent> ]X <Cmd>lua MiniBracketed.conflict('last')
onoremap <silent> ]c V<Cmd>lua MiniBracketed.comment('forward')
xnoremap <silent> ]c <Cmd>lua MiniBracketed.comment('forward')
nnoremap <silent> ]c <Cmd>lua MiniBracketed.comment('forward')
onoremap <silent> ]C V<Cmd>lua MiniBracketed.comment('last')
xnoremap <silent> ]C <Cmd>lua MiniBracketed.comment('last')
nnoremap <silent> ]C <Cmd>lua MiniBracketed.comment('last')
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ]B <Cmd>lua MiniBracketed.buffer('last')
nnoremap <silent> ]b <Cmd>lua MiniBracketed.buffer('forward')
nnoremap <silent> ]T <Cmd>lua MiniBracketed.treesitter('last')
nnoremap <silent> ]t <Cmd>lua MiniBracketed.treesitter('forward')
nnoremap <silent> ]L <Cmd>lua MiniBracketed.location('last')
nnoremap <silent> ]l <Cmd>lua MiniBracketed.location('forward')
nnoremap <silent> ]Q <Cmd>lua MiniBracketed.quickfix('last')
nnoremap <silent> ]q <Cmd>lua MiniBracketed.quickfix('forward')
nnoremap <silent> ]D <Cmd>lua MiniBracketed.diagnostic('last')
nnoremap <silent> ]d <Cmd>lua MiniBracketed.diagnostic('forward')
xmap a% <Plug>(MatchitVisualTextObject)
xnoremap <silent> gsa :lua MiniSurround.add('visual')
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap <silent> u u<Cmd>lua MiniBracketed.register_undo_state()
nnoremap <silent> <C-R> <Cmd>lua MiniBracketed.register_undo_state()
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <Right> l
nnoremap <Up> k
nnoremap <Down> j
nnoremap <Left> h
nmap <C-W><C-D> d
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
cnoremap  <Home>
inoremap  ^
cnoremap  <Left>
inoremap <expr>  getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<C-D>\<Esc>kJs":"\<Left>"
cnoremap <expr>  getcmdpos()>strlen(getcmdline())?"\<C-D>":"\<Del>"
inoremap <expr>  col('.')>strlen(getline('.'))?"\<C-D>":"\<Del>"
inoremap <expr>  col('.')>strlen(getline('.'))||pumvisible()?"\<C-E>":"\<End>"
cnoremap <expr>  getcmdpos()>strlen(getcmdline())?&cedit:"\<Right>"
inoremap <expr>  col('.')>strlen(getline('.'))?"\<C-F>":"\<Right>"
inoremap <silent> <expr>  v:lua.MiniPairs.cr()
inoremap  u
inoremap  u
cnoremap  
inoremap  
inoremap <expr> " v:lua.MiniPairs.closeopen('""', "[^\\].")
inoremap <expr> ' v:lua.MiniPairs.closeopen("''", "[^%a\\].")
inoremap <expr> ( v:lua.MiniPairs.open("()", "[^\\].")
inoremap <expr> ) v:lua.MiniPairs.close("()", "[^\\].")
inoremap <expr> [ v:lua.MiniPairs.open("[]", "[^\\].")
inoremap <expr> ] v:lua.MiniPairs.close("[]", "[^\\].")
inoremap <expr> ` v:lua.MiniPairs.closeopen("``", "[^\\].")
inoremap <expr> { v:lua.MiniPairs.open("{}", "[^\\].")
inoremap <expr> } v:lua.MiniPairs.close("{}", "[^\\].")
iabbr Gridpoint GridPoint
cabbr cc CodeCompanion
cabbr Xa xa
cabbr Qa! qa!
cabbr Qa qa
cabbr Q q
cabbr Wa wa
cabbr W w
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamedplus
set completeopt=menu,menuone,noinsert
set expandtab
set fillchars=horiz:â”€,vert:â”‚
set foldlevelstart=99
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
set helplang=en
set ignorecase
set inccommand=split
set laststatus=3
set listchars=eol:â†µ,extends:âŸ©,nbsp:â£,precedes:âŸ¨,space:Â·,tab:>-,trail:â€§
set pumheight=10
set runtimepath=~/.theme/nvim,~/.config/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,~/.local/share/nvim/site/pack/deps/opt/which-key.nvim,~/.local/share/nvim/site/pack/deps/opt/snacks.nvim,~/.local/share/nvim/site/pack/deps/opt/vim-rsi,~/.local/share/nvim/site/pack/deps/opt/oil.nvim,~/.local/share/nvim/site/pack/deps/opt/mini.surround,~/.local/share/nvim/site/pack/deps/opt/mini.pairs,~/.local/share/nvim/site/pack/deps/opt/mini.icons,~/.local/share/nvim/site/pack/deps/opt/mini.bracketed,~/.local/share/nvim/site/pack/deps/opt/mini.align,~/.local/share/nvim/site/pack/deps/opt/incline.nvim,~/.local/share/nvim/site/pack/deps/opt/heirline.nvim,~/.local/share/nvim/site/pack/deps/opt/mini.base16,~/.local/share/nvim/site/pack/deps/opt/gitsigns.nvim,~/.local/share/nvim/site/pack/deps/opt/nvim-scrollbar,~/.local/share/nvim/site/pack/deps/opt/vim-fugitive,~/.local/share/nvim/site/pack/deps/opt/flash.nvim,~/.local/share/nvim/site/pack/deps/opt/fidget.nvim,~/.local/share/nvim/site/pack/deps/opt/conjure,~/.local/share/nvim/site/pack/deps/opt/conform.nvim,~/.local/share/nvim/site/pack/deps/opt/blink.cmp,~/.local/share/nvim/site/pack/*/start/*,/usr/local/share/nvim/site,/usr/share/nvim/site,/Applications/Ghostty.app/Contents/Resources/ghostty/../nvim/site,~/.nix-profile/share/nvim/site,/nix/var/nix/profiles/default/share/nvim/site,~/.local/share/bob/nightly/share/nvim/runtime,~/.local/share/bob/nightly/share/nvim/runtime/pack/dist/opt/netrw,~/.local/share/bob/nightly/share/nvim/runtime/pack/dist/opt/matchit,~/.local/share/bob/nightly/lib/nvim,/nix/var/nix/profiles/default/share/nvim/site/after,~/.nix-profile/share/nvim/site/after,/Applications/Ghostty.app/Contents/Resources/ghostty/../nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after
set scrolloff=13
set shiftwidth=2
set noshowmode
set sidescrolloff=8
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set statusline=%{%v:lua.require'heirline'.eval_statusline()%}
set tabstop=2
set termguicolors
set timeoutlen=250
set undofile
set updatetime=250
set window=47
set winminheight=0
set winminwidth=0
" vim: set ft=vim :
