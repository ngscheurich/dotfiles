return function(config)
  require("lspconfig").efm.setup(
    vim.tbl_extend("force", config, {
      filetypes = {"elixir", "typescript", "typescriptreact", "javascript"},
    })
  )
end
