---Similar to Vim's `augroup` command.
---@param name string
---@param callback function
function _G.ngs.vim.augroup(name, callback)
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!')
  callback()
  vim.cmd('augroup END')
end

---Similar to Vim's `autocmd` command.
---@param event string
---@param pat string
---@param cmd string or function
function _G.ngs.vim.autocmd(event, pat, cmd)
  vim.cmd(string.format("autocmd %s %s %s", event, pat, cmd))
end

---Similar to Vim's `command` command.
---@param lhs string
---@param rhs string
---@param nargs string
function _G.ngs.vim.command(lhs, rhs, nargs)
  if nargs == nil then nargs = "0" end
  vim.cmd(string.format("command! -nargs=%s %s %s", nargs, lhs, rhs))
end

---Similar to Vim's `highlight` command. Only sets `gui` colors.
---@param group string
---@param opts table
function _G.ngs.vim.highlight(group, opts)
  local fg = opts.fg or "NONE"
  local bg = opts.bg or "NONE"
  local attrs = opts.attrs or "NONE"
  local command = string.format("highlight %s gui=%s guifg=%s guibg=%s", group, attrs, fg, bg)
  vim.cmd(command)
end

-- Creates functions similar to Vim's `abbrev` commands, e.g. `iabbrev`, `cabbrev`.
for _, mode in ipairs({"i", "c"}) do
  _G.ngs.vim[mode .. "abbrev"] = function(lhs, rhs)
    vim.cmd(string.format("%sabbrev %s %s", mode, lhs, rhs))
  end
end

-- Creates functions similar to Vim's  `map` and `noremap` commands, e.g. `nnoremap`, `smap`.
local function map(mode, lhs, rhs, opts, buflocal)
  if opts == nil then opts = {} end
  if type(rhs) == "function" then
    rhs = "<Cmd>"
  end
  if buflocal then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

local modes = {"n", "v", "s", "x", "o", "i", "l", "c", "t"}
for _, mode in pairs(modes) do
  _G.ngs.vim[mode .. "map"] = function (lhs, rhs, opts)
    if not opts then opts = {} end
    map(mode, lhs, rhs, opts, opts.buflocal)
  end

  _G.ngs.vim[mode .. "noremap"] = function (lhs, rhs, opts)
    if not opts then opts = {} end
    local o = vim.tbl_extend("force", {noremap = true}, opts)
    map(mode, lhs, rhs, o, opts.buflocal)
  end
end
