local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.deps"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.deps`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.deps",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd.packadd("mini.deps")
  vim.cmd.helptags("ALL")
  vim.notify("Installed mini.deps")
  vim.cmd("redraw")
end

require("mini.deps").setup({ path = { package = path_package } })
