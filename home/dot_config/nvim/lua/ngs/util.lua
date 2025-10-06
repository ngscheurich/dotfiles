local M = {}
local colors = require("lib.colors")

---Check if a Lua module is loaded
---@param module string
---@return boolean
M.is_loaded = function(module)
  return package.loaded[module] ~= nil
end

---Unload a Lua module
---@param module string
M.unload = function(module)
  package.loaded[module] = nil
end

---Reload a Lua module
---@param module string
M.reload = function(module)
  package.loaded[module] = nil
  require(module)
end

---Toggle a Neovim option
---@param name string
M.toggle_opt = function(name)
  local on, off

  if name == "signcolumn" then
    on, off = "yes", "no"
  else
    on, off = true, false
  end

  if vim.o[name] == on then
    vim.o[name] = off
  else
    vim.o[name] = on
  end
end

---Get the `attr` of the given Neovim highlight group
---@param name string
---@param attr string
---@return string
M.get_hl_attr = function(name, attr)
  local id = vim.fn.hlID(name)
  local resolved_id = vim.fn.synIDtrans(id)
  return vim.fn.synIDattr(resolved_id, attr)
end

---Load local theme plugin
M.load_theme = function()
  vim.opt.runtimepath:prepend(vim.env.HOME .. "/.theme/nvim")
  M.unload("ngs.theme")
  local theme_ok, theme = pcall(require, "ngs.theme")
  if theme_ok then
    local ngs = vim.g.ngs
    ngs.theme = theme
    vim.g.ngs = ngs
  else
    vim.notify("Could not load theme")
  end
end

---Reconfigure plugins that rely on `vim.g.ngs.theme`
M.reload_theme = function()
  M.load_theme()
  vim.g.ngs.theme.apply(require("mini.base16").setup)
  package.loaded["ngs.statusline"] = nil
  require("ngs.statusline").build()
end

---Adjust the lightness of a hexidecimal color
---@param hex string
---@param amount number
---@return string
M.lighten_to = function(hex, amount)
  local color = colors.new(hex)
  return color:lighten_to(amount):to_rgb()
end

return M
