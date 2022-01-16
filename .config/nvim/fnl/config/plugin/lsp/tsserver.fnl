(module config.plugin.lsp.tsserver
  {autoload {lspconfig lspconfig}})

(fn setup [config]
  (lspconfig.tsserver.setup
    (vim.tbl_extend :force config
                    {:filetypes [:typescript :javascript :typescriptreact]
                     :on_attach (fn [client bufnr]
                                  (config.on_attach client bufnr)
                                  (tset client :resolved_capabilities :document_formatting false)
                                  (tset client :resolved_capabilities :document_range_formatting false))})))
