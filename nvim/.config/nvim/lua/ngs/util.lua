---Prints the `vim.inspect` value of `obj`.
---@param obj any
---@param opts table
function _G.ngs.inspect(obj, opts)
  if opts == nil then opts = {} end
  print(vim.inspect(obj, opts))
end

---Joins paths with a `"/"`.
---@return string
function _G.ngs.util.join_paths(...)
  return table.concat({...}, "/")
end

---Set tab spacing related local options.
---@param width number
function _G.ngs.util.set_tab_width(width)
  vim.opt_local.shiftwidth = width
  vim.opt_local.softtabstop = width
  vim.opt_local.tabstop = width
end

---Executes an `autocmd` to set the filetype for a list of patterns.
---@param ft string
---@param pats table
function _G.ngs.util.set_filetype(ft, pats)
  local pat = table.concat(pats, ",")
  vim.cmd(string.format("autocmd BufNewFile,BufRead %s set filetype=%s", pat, ft))
end

---Clone packer.nvim as an optional package.
function _G.ngs.util.get_packer()
  local url = "https://github.com/wbthomason/packer.nvim"
  local dest = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if vim.fn.input("Download packer? (y/N) ") == "y" then
    vim.cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
    print("✔ packer downloaded successfully")
  end
end

---Toggles line numbers for the current window.
function _G.ngs.util.toggle_line_numbers()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end

---Toggles the sign column for the current window.
function _G.ngs.util.toggle_sign_column()
  if vim.wo.signcolumn == "yes" then
    vim.wo.signcolumn = "no"
  else
    vim.wo.signcolumn = "yes"
  end
end

---Returns information about the syntax item at line/col. Defaults to cursor position.
---@param line number
---@param col number
---@return table
function _G.ngs.util.get_syntax_item(line, col)
  line = line or vim.fn.line(".")
  col = col or vim.fn.col(".")

  local synid = vim.fn.synID(line, col, false)

  return {
    id            = synid,
    name          = vim.fn.synIDattr(synid, "name"),
    link          = vim.fn.synIDattr(vim.fn.synIDtrans(synid), "name"),
    fg            = vim.fn.synIDattr(synid, "fg"),
    bg            = vim.fn.synIDattr(synid, "bg"),
    guifg         = vim.fn.synIDattr(synid, "fg#"),
    guibg         = vim.fn.synIDattr(synid, "bg#"),
    font          = vim.fn.synIDattr(synid, "font"),
    sp            = vim.fn.synIDattr(synid, "sp"),
    bold          = vim.fn.synIDattr(synid, "bold"),
    italic        = vim.fn.synIDattr(synid, "italic"),
    reverse       = vim.fn.synIDattr(synid, "reverse"),
    inverse       = vim.fn.synIDattr(synid, "inverse"),
    standout      = vim.fn.synIDattr(synid, "standout"),
    underline     = vim.fn.synIDattr(synid, "underline"),
    undercurl     = vim.fn.synIDattr(synid, "undercurl"),
    strikethrough = vim.fn.synIDattr(synid, "strikethrough"),
  }
end

---Returns the name of the syntax item at line/col. Defaults to cursor position.
---@param line number
---@param col number
---@return string
function _G.ngs.util.identify_syntax_item(line, col)
  local item = _G.ngs.util.get_syntax_item(line, col)

  if item.name == "" then return nil end

  local out = item.name
  if item.link == "" then return out end

  return out .. " -> " .. item.link
end

---Returns the value of a highlight group's attribute.
---@param group string
---@param attr string
---@return string
function _G.ngs.util.get_highlight_attr(group, attr)
  local hlid = vim.fn.hlID(group)
  local synid = vim.fn.synIDtrans(hlid)
  return vim.fn.synIDattr(synid, attr)
end
