(module config.plugin.lsp.elixirls
  {autoload {lspconfig lspconfig}})

(fn setup [config]
  (lspconfig.elixirls.setup
    (vim.tbl_extend :force config
                    {:cmd [:/usr/local/opt/elixir-ls/language_server.sh]
                     :settings {:elixirLS {:fetchDeps false}}})))
