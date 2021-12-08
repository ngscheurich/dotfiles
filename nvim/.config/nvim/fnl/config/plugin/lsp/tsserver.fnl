(module config.plugin.lsp.tsserver
  {autoload {lspconfig lspconfig}})

(fn setup [config]
  (lspconfig.tsserver.setup
    (vim.tbl_extend :force config {:filetypes [:typescript :javascript :typescriptreact]})))
