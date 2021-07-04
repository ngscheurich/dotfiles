return function(on_attach)
  require("lspconfig").elixirls.setup({
    cmd = {"/usr/local/opt/elixir-ls/language_server.sh"},
    on_attach =  on_attach,
    settings = {elixirLS = {fetchDeps = false}},
  })
end
