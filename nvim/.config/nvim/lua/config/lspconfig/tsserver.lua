return function(config)
  require("lspconfig").tsserver.setup(
    vim.tbl_extend("force", config, {
      filetypes = {"typescript", "javascript", "typescriptreact"},
    })
  )
end
