local M = {}

local fn, cmd = vim.fn, vim.cmd

function M.get_packer()
  local url = "https://github.com/wbthomason/packer.nvim"
  local dest = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if fn.input("Download packer? (y/N) ") == "y" then
    cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
    print("✔ packer downloaded successfully")
  end
end

function M.get_highlight_attr(group, attr)
  local hlid = fn.hlID(group)
  local synid = fn.synIDtrans(hlid)
  return fn.synIDattr(synid, attr)
end

function M.highlight(group, opts)
  local fg = opts.fg or "NONE"
  local bg = opts.bg or "NONE"
  local attrs = opts.attrs or "NONE"
  local command = string.format("highlight %s gui=%s guifg=%s guibg=%s", group, attrs, fg, bg)
  cmd(command)
end

function M.join_paths(...) return table.concat({...}, "/") end

function M.toggle_line_numbers()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end

function M.toggle_sign_column()
  if vim.wo.signcolumn == "yes" then
    vim.wo.signcolumn = "no"
  else
    vim.wo.signcolumn = "yes"
  end
end

function M.load_theme(theme)
  _G.ngs.theme = theme
  require("lush")(theme.spec)
  require("feline").reset_highlights()
end

return M
