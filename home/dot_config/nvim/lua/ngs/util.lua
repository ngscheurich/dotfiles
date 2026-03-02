local M = {}
local colors = require("vendor.colors")

---Unload a Lua module
---@param module string
M.unload = function(module) package.loaded[module] = nil end

---Reload a Lua module
---@param module string
M.reload = function(module)
  package.loaded[module] = nil
  require(module)
end

---Toggle a Neovim option
---@param name string
M.toggle = function(name)
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
    Config.theme = theme
  else
    vim.notify("Could not load theme")
  end
end

---Load and set up local theme plugin; reload reliant plugins
M.setup_theme = function()
  M.load_theme()

  Config.theme.setup()

  M.unload("ngs.statusline")
  require("ngs.statusline").setup()
end

---Adjust the lightness of a hexidecimal color
---@param hex string
---@param amount number
---@return string
M.lighten_to = function(hex, amount)
  local color = colors.new(hex)
  return color:lighten_to(amount):to_rgb()
end

---Set a normal mode keymap
---@param lhs string
---@param rhs string|function
---@param desc string?
M.nmap = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { desc = desc }) end

---Set a normal mode `<Leader>` keymap
---@param lhs string
---@param rhs string|function
---@param desc string?
M.nmap_leader = function(lhs, rhs, desc)
  M.nmap("<Leader>" .. lhs, rhs, desc or "")
end

return M
