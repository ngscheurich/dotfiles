return function(on_attach)
  local pid = vim.fn.getpid()
  local omnisharp_bin = "/Users/nick/tools/omnisharp-osx/run"

  require("lspconfig").omnisharp.setup({
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
    on_attach = on_attach
  })
end
