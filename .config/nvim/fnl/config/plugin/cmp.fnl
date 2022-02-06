(module config.plugin.cmp
  {autoload {cmp cmp
             snip luasnip}})

; (defn- has-words-before []
;   (let [(line col) (get-cursor)]
;     (and (not= col 0)
;          (= (-> line
;              (get-line)
;              (string.sub 1 1)
;              (string.match "%s")) nil))))
;
; (defn- get-cursor [] (unpack (vim.api.nvim_win_get_cursor 0)))
;
; (defn- get-line [line]
;   (unpack (vim.api.nvim_buf_get_lines 0 (- line 1) line true)))

;; TODO: Rewrite this
(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (and (not= col 0) (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line
                                                              true)
                                  1) :sub col
                               col) :match "%s") nil))))

(defn- do-tab [fallback]
  (if (cmp.visible) (cmp.select_next_item)
      (snip.expand_or_locally_jumpable) (snip.expand_or_jump)
      (has-words-before) (cmp.complete)
      (fallback)))

(defn- do-s-tab [fallback]
  (if (cmp.visible) (cmp.select_prev_item)
      (snip.jumpable -1) (snip.jump -1)
      (fallback)))

(cmp.setup
  {:sources [{:name :nvim_lsp :keyword_length 3}
             {:name :buffer :keyword_length 5}
             {:name :luasnip}]
   :mapping {:<CR> (cmp.mapping.confirm)
             :<C-Space> (cmp.mapping.complete)
             :<C-E> (cmp.mapping.close)
             :<Tab> (cmp.mapping do-tab ["i" "s"])
             :<S-Tab> (cmp.mapping do-s-tab ["i" "s"])}
   :snippet {:expand (fn [args] (snip.lsp_expand args.body))}})
