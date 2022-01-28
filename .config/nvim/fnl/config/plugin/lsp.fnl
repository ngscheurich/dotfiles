(module config.plugin.lsp
  {autoload {lspconfig lspconfig
             cmp_nvim_lsp cmp_nvim_lsp
             nls null-ls
             a aniseed.core
             nvim aniseed.nvim
             u config.util}})

(defn- update-capabilities [client]
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (cmp_nvim_lsp.update_capabilities capabilities)))

(defn- apply-mappings [bufnr]
  (let [opts {:bufnr bufnr}]
    (u.nnoremap "<C-]>"     "<Cmd>lua vim.lsp.buf.definition()<CR>")
    (u.nnoremap :K          "<Cmd>lua vim.lsp.buf.hover()<CR>")
    (u.nnoremap "[d"        "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
    (u.nnoremap "]d"        "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
    (u.nnoremap :<Leader>la "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    (u.nnoremap :<Leader>ld "<Cmd>lua vim.diagnostic.open_float()<CR>")
    (u.nnoremap :<Leader>lf "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
    (u.nnoremap :<Leader>lR "<Cmd>lua vim.lsp.buf.rename()<CR>")
    (u.nnoremap :<Leader>lr "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
    (u.nnoremap :<Leader>ls "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
    (u.nnoremap :<Leader>lt "<Cmd>lua vim.lsp.buf.type_definition()<CR>")))

(defn- add-format-autocmd [client]
  (if (= client.resolved_capabilities.document_formatting true)
    (nvim.ex.autocmd :BufWritePre :<buffer> "lua vim.lsp.buf.formatting_sync()")))

(def- config {:capabilities (update-capabilities)
              :on_attach (fn [client bufnr]
                           (apply-mappings bufnr)
                           (add-format-autocmd client))})

(let [servers [:cssls
               :elixirls
               :gdscript
               :pyright
               :rls
               :sumneko-lua
               :terraformls
               :tsserver
               :vimls]]
  (each [_ server (ipairs servers)]
    (let [(ok? server-setup) (pcall require (.. :config.plugin.lsp. server))]
      (if ok?
        (server-setup config)
        ((. lspconfig server :setup) config)))))

(nls.setup {:sources [nls.builtins.formatting.prettierd
                      nls.builtins.formatting.eslint_d
                      nls.builtins.diagnostics.eslint_d
                      ]
            :on_attach (fn [client]
                         (add-format-autocmd client))})
