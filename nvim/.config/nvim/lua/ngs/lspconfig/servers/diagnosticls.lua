local linters = {
  eslint = require("ngs.lspconfig.linters.eslint"),
  stylelint = require("ngs.lspconfig.linters.stylelint"),
  shellcheck = require("ngs.lspconfig.linters.shellcheck"),
}

return function(config)
  require("lspconfig").diagnosticls.setup(
    vim.tbl_extend("force", config, {
      filetypes = {"javascript", "typescript", "css", "sh"},
      init_options = {
        linters = linters,
        filetypes = {
          javascript = "eslint",
          typescript = "eslint",
          css = "stylelint",
          sh = "shellcheck",
        },
      }
    })
  )
end
