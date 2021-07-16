local ngs = {}

local api, cmd = vim.api, vim.cmd

--- Adds `map` and `noremap` functions for each mode.
local function map(mode, lhs, rhs, opts, buflocal)
  if opts == nil then opts = {} end
  if buflocal then
    api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

local modes = {"n", "v", "s", "x", "o", "i", "l", "c", "t"}
for _, mode in pairs(modes) do
	ngs[mode .. "map"] = function (lhs, rhs, opts)
    if not opts then opts = {} end
    map(mode, lhs, rhs, opts, opts.buflocal)
  end

  ngs[mode .. "noremap"] = function (lhs, rhs, opts)
    if not opts then opts = {} end
    local o = vim.tbl_extend("force", {noremap = true}, opts)
    map(mode, lhs, rhs, o, opts.buflocal)
  end
end

function ngs.inspect(obj, opts)
  if opts == nil then opts = {} end
  print(vim.inspect(obj, opts))
end

function ngs.augroup(name, defs)
  cmd("augroup " .. name)
  cmd("autocmd!")
  for _, def in ipairs(defs) do vim.api.nvim_exec("autocmd " .. def, "") end
  cmd("augroup END")
end

function ngs.abbrev(mode, abbrs)
  for _, t in ipairs(abbrs) do
    cmd(string.format("%sabbrev %s %s", mode, t[1], t[2]))
  end
end

function ngs.lua_command(name, mod, fn)
  cmd(string.format("command! %s lua require('%s').%s()", name, mod, fn))
end

function ngs.set_tab_width(width)
  vim.opt_local.shiftwidth = width
  vim.opt_local.softtabstop = width
  vim.opt_local.tabstop = width
end

function ngs.set_filetype(ft, pats)
  local pat = table.concat(pats, ",")
  cmd(string.format("autocmd BufNewFile,BufRead %s set filetype=%s", pat, ft))
end

_G.ngs = ngs
