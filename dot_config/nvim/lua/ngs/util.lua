local M = {}

---Unload a Lua module.
---@param module string
---@return nil
M.unload = function(module)
  package.loaded[module] = nil
end

---Toggle a Neovim option.
---@param name string
---@return nil
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

---Get the `attr` of the given Neovim highlight group.
---@param name string
---@param attr string
---@return string
M.get_hl_attr = function(name, attr)
  local id = vim.fn.hlID(name)
  return vim.fn.synIDattr(id, attr)
end

---Load local theme plugin.
---@return nil
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

---Reconfigure plugins that rely on `vim.g.ngs.theme`.
---@param reload_theme? boolean | nil
---@return nil
M.reload_theme = function(reload_theme)
  if reload_theme then
    M.load_theme()
  end

  local specs = { "ngs.specs.kanagawa", "ngs.specs.heirline" }
  for _, spec in ipairs(specs) do
    M.unload(spec)
    require(spec).config()
  end
end

return M
