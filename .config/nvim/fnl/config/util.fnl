(module config.util
  {autoload {a aniseed.core
             nvim aniseed.nvim}})

(local util {})

(defn- set_keymap [mode lhs rhs opts bufnr]
  (if buflocal
    (vim.api.nvim_buf_set_keymap bufnr mode lhs rhs opts)
    (vim.api.nvim_set_keymap mode lhs rhs opts)))

(let [modes [:n :v :s :x :o :i :l :c :t]]
  (each [_ mode (ipairs modes)]
    (tset util (.. mode :map)
          (fn [lhs rhs opts]
            (when (not opts)
              (set-forcibly! opts {}))
            (set_keymap mode lhs rhs opts (. opts :buflocal))))

    (tset util (.. mode :noremap)
          (fn [lhs rhs opts]
            (when (not opts)
              (set-forcibly! opts {}))
            (local opts (vim.tbl_extend :force {:noremap true} opts))
            (set_keymap mode lhs rhs opts opts.bufnr)))))

(let [modes [:i :c]]
  (each [_ mode (ipairs modes)]
    (tset util (.. mode :abbrev)
          (fn [...]
            (for [i 1 (a.count [...]) 2]
              ((. nvim.ex (.. mode :abbrev))
                (. [...] i)
                (. [...] (+ i 1))))))))

util
