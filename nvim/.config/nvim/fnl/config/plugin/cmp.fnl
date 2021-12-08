(module config.plugin.cmp
  {autoload {cmp cmp
             snip luasnip}})

(cmp.setup
  {:sources [{:name :nvim_lsp :keyword_length 3}
             {:name :buffer :keyword_length 5}
             {:name :luasnip}]
   :mapping {:<C-Space> (cmp.mapping.complete)
             :<C-E> (cmp.mapping.close)}
   :snippet (fn [args]
              (snip.lsp_expand (. args :body)))})
