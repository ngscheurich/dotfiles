let s:colorscheme = 'powerline'
if exists('g:colors_name')
  if g:colors_name == 'one'
    let s:colorscheme = 'one'
  elseif g:colors_name == 'base16-tomorrow-night'
    let s:colorscheme = 'Tomorrow_Night'
  end
end

let g:lightline = {}
let g:lightline.colorscheme = s:colorscheme
let g:lightline.active = {
      \ 'left':  [['mode', 'paste'], ['readonly', 'filename'], ['lspstatus']],
      \ 'right': [['lineinfo'], ['filetype'], ['gitbranch']],
      \ } 
let g:lightline.inactive = {
      \ 'left':  [['readonly', 'filename', 'modified']],
      \ 'right': [['lineinfo']],
      \ }
let g:lightline.component = {
      \ 'fileinfo': '%{&ff} [%{&fenc!=#''?&fenc:&enc}]',
      \ }
let g:lightline.component_function = {
      \ 'filename':  'ngs#statusline#Filename',
      \ 'lspstatus': 'ngs#statusline#LspStatus',
      \ 'filetype':  'ngs#statusline#Filetype',
      \ 'gitbranch': 'ngs#statusline#GitBranch',
      \ }
