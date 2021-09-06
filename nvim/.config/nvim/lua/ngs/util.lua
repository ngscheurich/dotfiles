local util = {}

local cmd = vim.cmd

function util.get_packer()
  local url = "https://github.com/wbthomason/packer.nvim"
  local dest = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if vim.fn.input("Download packer? (y/N) ") == "y" then
    cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
    print("✔ packer downloaded successfully")
  end
end

-- function util.paq_get()
--   local url = "https://github.com/savq/paq-nvim"
--   local dest = vim.fn.stdpath("data") .. "/site/pack/paqs/opt/paq-nvim"

--   if vim.fn.input("Download Paq? (y/N) ") == "y" then
--     cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
--     print("✔ Paq downloaded successfully")
--   end
-- end

function util.get_highlight_attr(group, attr)
  local hl_id = vim.fn.hlID(group)
  local syntax_id = vim.fn.synIDtrans(hl_id)
  return vim.fn.synIDattr(syntax_id, attr)
end

function util.highlight(group, opts)
  local fg = opts.fg or "NONE"
  local bg = opts.bg or "NONE"
  local attrs = opts.attrs or "NONE"
  local command = string.format(
    "highlight %s gui=%s guifg=%s guibg=%s", group, attrs, fg, bg
  )
  cmd(command)
end

function util.join_paths(...) return table.concat({...}, "/") end

function util.toggle_line_numbers()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end

function util.toggle_sign_column()
  if vim.wo.signcolumn == "yes" then
    vim.wo.signcolumn = "no"
  else
    vim.wo.signcolumn = "yes"
  end
end

return util
