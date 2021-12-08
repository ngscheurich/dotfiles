(module config.plugin.lsp
  {autoload {lspconfig lspconfig
             cmp_nvim_lsp cmp_nvim_lsp
             a aniseed.core
             u config.util}})

(def- config {:capabilities (cmp_nvim_lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
              :on_attach (fn map-lsp-keys []
                           (u.nnoremap "<C-]>" "<Cmd>lua vim.lsp.buf.definition()<CR>")
                           (u.nnoremap :K      "<Cmd>lua vim.lsp.buf.hover()<CR>")
                           (u.nnoremap "[d"    "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
                           (u.nnoremap "]d"    "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

                           (u.nnoremap :<Leader>la "<Cmd>lua vim.lsp.buf.code_action()<CR>")
                           (u.nnoremap :<Leader>ld "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
                           (u.nnoremap :<Leader>lf "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
                           (u.nnoremap :<Leader>lR "<Cmd>lua vim.lsp.buf.rename()<CR>")
                           (u.nnoremap :<Leader>lr "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
                           (u.nnoremap :<Leader>ls "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
                           (u.nnoremap :<Leader>lt "<Cmd>lua vim.lsp.buf.type_definition()<CR>"))})

(let [servers [:elixirls
               :gdscript
               :pyright
               :rls
               :sumneko-lua
               :terraformls
               :tsserver
               :vimls]]
  (each [_ server (ipairs servers)]
    (let [(ok? func) (pcall require (.. :config.package.lsp. server))]
      (if ok?
        (func config)
        ((. (. lspconfig server) :setup) config)))))
