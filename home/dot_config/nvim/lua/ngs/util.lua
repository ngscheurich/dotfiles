local M = {}

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
  end
end

---Reconfigure plugins that rely on `vim.g.ngs.theme`
---@param reload_theme? boolean | nil
M.reload_theme = function(reload_theme)
  if reload_theme then
    M.load_theme()
  end

  -- TODO: Update to reflect new colorscheme and config
  local specs = { "ngs.specs.nightfox", "ngs.specs.heirline" }
  for _, spec in ipairs(specs) do
    M.unload(spec)
    require(spec).config()
  end
end

return M
