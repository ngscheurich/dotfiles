function! FormatLV() abort
  normal ?"""^MjV/"""^Mk
  execute "'<,'>!npx prettier --parser html"
  normal ?"""^MjV/"""^Mk2>
endfunction

function! Grep(pat) abort
  execute "silent grep " . a:pat
endfunction
