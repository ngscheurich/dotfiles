return function(config)
  require("lspconfig").haxe_language_server.setup(
    vim.tbl_extend("force", config, {
      init_options = {displayArguments = {"compile.hxml"}},
    })
  )
end
