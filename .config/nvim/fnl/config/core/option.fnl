(module config.core.option
  {autoload {a aniseed.core
             nvim aniseed.nvim}})

(defn- set-opts [...]
  (for [i 1 (a.count [...]) 2]
    (let [opt (. [...] i)
          val (. [...] (+ i 1))]
      (a.assoc vim.opt opt val))))

(set-opts
  :cursorline     true
  :expandtab      true
  :fillchars      "vert:│"
  :foldlevel      99
  :foldmethod     "marker"
  :grepprg        "rg --vimgrep"
  :hidden         true
  :ignorecase     true
  :inccommand     "split"
  :mouse          "a"
  :showmode       false
  :swapfile       false
  :number         true
  :relativenumber true
  :scrolloff      10
  :shiftwidth     2
  :signcolumn     "yes"
  :smartcase      true
  :smartindent    true
  :softtabstop    2
  :splitbelow     true
  :splitright     true
  :tabstop        2
  :termguicolors  true
  :undofile       true
  :updatetime     1000
  :shortmess      (.. vim.o.shortmess "c" )
  :completeopt    [:menuone :noselect]

  :listchars {:tab :>-
              :eol :↵
              :nbsp :␣
              :trail :‧
              :extends :⟩
              :precedes :⟨}) 
