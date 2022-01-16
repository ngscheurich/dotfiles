(module config.core.autocmd
  {autoload {nvim aniseed.nvim}
   require-macros [config.macros]})

(augroup yank
         (nvim.ex.autocmd :TextYankPost :* "lua vim.highlight.on_yank()"))
