(module config.plugin.lsp.elixirls
  {autoload {lspconfig lspconfig}})

(fn setup [config]
  (lspconfig.elixirls.setup
    (vim.tbl_extend :force config
                    {:cmd [:elixir-ls]
                     :settings {:elixirLS {:fetchDeps false}}})))
