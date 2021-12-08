local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

local function ensure(user, repo)
  local install_path = fmt("%s/packer/start/%s", pack_path, repo)

  if fn.empty(fn.glob(install_path)) > 0 then
    vim.cmd(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    vim.cmd(fmt("packadd %s", repo))
  end
end

ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")

vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g["aniseed#env"] = {module = "config.init"}
