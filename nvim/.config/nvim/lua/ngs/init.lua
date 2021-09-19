-- TODO: What goes here and what goes in 'util'?
local M = {}

M.util  = require("ngs.util")

local api, cmd, fn = vim.api, vim.cmd, vim.fn

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
	M[mode .. "map"] = function (lhs, rhs, opts)
    if not opts then opts = {} end
    map(mode, lhs, rhs, opts, opts.buflocal)
  end

  M[mode .. "noremap"] = function (lhs, rhs, opts)
    if not opts then opts = {} end
    local o = vim.tbl_extend("force", {noremap = true}, opts)
    map(mode, lhs, rhs, o, opts.buflocal)
  end
end

function M.inspect(obj, opts)
  if opts == nil then opts = {} end
  print(vim.inspect(obj, opts))
end

function M.augroup(name, defs)
  cmd("augroup " .. name)
  cmd("autocmd!")
  for _, def in ipairs(defs) do vim.api.nvim_exec("autocmd " .. def, "") end
  cmd("augroup END")
end

function M.abbrev(mode, abbrs)
  for _, t in ipairs(abbrs) do
    cmd(string.format("%sabbrev %s %s", mode, t[1], t[2]))
  end
end

function M.command(lhs, rhs, nargs)
  if nargs == nil then nargs = "0" end
  cmd(string.format("command! -nargs=%s %s %s", nargs, lhs, rhs))
end

function M.fncommand(lhs, mod, func)
  cmd(string.format("command! %s lua require('%s').%s()", lhs, mod, func))
end

function M.fnmap(lhs, mod, func, mapfn, opts)
  local rhs = string.format("<Cmd>lua require('%s').%s()<CR>", mod, func)
  mapfn(lhs, rhs, opts or {})
end

function M.set_tab_width(width)
  vim.opt_local.shiftwidth = width
  vim.opt_local.softtabstop = width
  vim.opt_local.tabstop = width
end

function M.set_filetype(ft, pats)
  local pat = table.concat(pats, ",")
  cmd(string.format("autocmd BufNewFile,BufRead %s set filetype=%s", pat, ft))
end

function M.get_syntax_item(line, col)
  line = line or fn.line(".")
  col = col or fn.col(".")

  local synid = fn.synID(line, col, false)

  return {
    id = synid,
    name =  fn.synIDattr(synid, "name"),
    link = fn.synIDattr(fn.synIDtrans(synid), "name"),
    fg = fn.synIDattr(synid, "fg"),
    bg = fn.synIDattr(synid, "bg"),
    guifg = fn.synIDattr(synid, "fg#"),
    guibg = fn.synIDattr(synid, "bg#"),
    font = fn.synIDattr(synid, "font"),
    sp = fn.synIDattr(synid, "sp"),
    bold = fn.synIDattr(synid, "bold"),
    italic = fn.synIDattr(synid, "italic"),
    reverse = fn.synIDattr(synid, "reverse"),
    inverse = fn.synIDattr(synid, "inverse"),
    standout = fn.synIDattr(synid, "standout"),
    underline = fn.synIDattr(synid, "underline"),
    undercurl = fn.synIDattr(synid, "undercurl"),
    strikethrough = fn.synIDattr(synid, "strikethrough"),
  }
end

function M.identify_syntax_item(line, col)
  local item = M.get_syntax_item(line, col)

  if item.name == "" then return nil end

  local out = item.name
  if item.link == "" then return out end

  return out .. " -> " .. item.link
end

_G.ngs = M
