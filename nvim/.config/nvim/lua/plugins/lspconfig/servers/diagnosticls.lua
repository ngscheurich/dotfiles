local linters = {
  eslint = require("plugins/lspconfig/linters/eslint"),
  stylelint = require("plugins/lspconfig/linters/stylelint"),
}

return function(config)
  require("lspconfig").diagnosticls.setup(
    vim.tbl_extend("force", config, {
      filetypes = {"javascript", "typescript", "css"},
      init_options = {
        linters = linters,
        filetypes = {
          javascript = "eslint",
          typescript = "eslint",
          css = "stylelint",
        },
      }
    })
  )
end
