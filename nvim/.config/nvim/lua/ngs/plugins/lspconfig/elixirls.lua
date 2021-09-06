return function(config)
  require("lspconfig").elixirls.setup(
    vim.tbl_extend("force", config, {
      cmd = {"/usr/local/opt/elixir-ls/language_server.sh"},
      settings = {elixirLS = {fetchDeps = false}},
    })
  )
end
