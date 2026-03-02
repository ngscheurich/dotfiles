-- =============================================================================
--  Keymaps
-- -----------------------------------------------------------------------------

local util = require("ngs.util")
local nmap, nmap_leader, toggle = util.nmap, util.nmap_leader, util.toggle

nmap("<Left>", "<C-w>h")
nmap("<Down>", "<C-w>j")
nmap("<Up>", "<C-w>k")
nmap("<Right>", "<C-w>l")

nmap("<Esc>", "<Cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

nmap_leader("tn", function() toggle("number") end, "Line numbers")
nmap_leader("tw", function() toggle("list") end, "Whitespace")
nmap_leader("tc", function() toggle("cursorline") end, "Cursorline")

nmap_leader("td", function()
  local virtual_lines = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtal_lines = virtual_lines })
end, "Diagnostic virtual lines")

nmap_leader("dd", vim.diagnostic.open_float, "Cursor")
