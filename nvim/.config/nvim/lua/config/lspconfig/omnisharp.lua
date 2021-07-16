return function(config)
  local pid = vim.fn.getpid()
  local omnisharp_bin = "/Users/nick/tools/omnisharp-osx/run"

  require("lspconfig").omnisharp.setup(
    vim.tbl_extend("force", config, {
      cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
    })
  )
end
