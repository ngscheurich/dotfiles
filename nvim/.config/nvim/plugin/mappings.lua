-- =========================================================
-- Mappings
-- =========================================================

-- Map <Leader> to <Space>
vim.g.mapleader = " "

local v = ngs.vim
local nnoremap, onoremap, xnoremap, nmap, xmap =
  v.nnoremap, v.onoremap, v.xnoremap, v.nmap, v.xmap

-- Split navigation
nnoremap("<Left>", "<C-w>h")
nnoremap("<Down>", "<C-w>j")
nnoremap("<Up>", "<C-w>k")
nnoremap("<Right>", "<C-w>l")

-- Clear search highlighting on <Esc>
nnoremap("<Esc>", "<Cmd>nohlsearch<CR>")

-- Window resizing
nnoremap("<M-=>", "<Cmd>5wincmd +<CR>")
nnoremap("<M-->", "<Cmd>5wincmd -<CR>")
nnoremap("<M-.>", "<Cmd>5wincmd ><CR>")
nnoremap("<M-,>", "<Cmd>5wincmd <<CR>")

-- Buffer management
nnoremap("<Leader>bd", "<Cmd>bdelete<CR>")
nnoremap("<Leader>bh", "<Cmd>Startify<CR>")
nnoremap("<Leader>bn", "<Cmd>bnext<CR>")
nnoremap("<Leader>bp", "<Cmd>bprevious<CR>")

-- UI Toggles
nnoremap("<Leader>un",  "<Cmd>lua ngs.util.toggle_line_numbers()<CR>")
nnoremap("<Leader>us",  "<Cmd>lua ngs.util.toggle_sign_column()<CR>")
nnoremap("<Leader>ugs", "<Cmd>Gitsigns toggle_signs<CR>")
nnoremap("<Leader>ugb", "<Cmd>Gitsigns toggle_current_line_blame<CR>")
nnoremap("<Leader>ui",  "<Cmd>IndentBlanklineToggle<CR>")

-- Gitsigns
local function gsmap(fn)
  return '<Cmd>lua require("gitsigns").'..fn.."()<CR>"
end

nnoremap("<Leader>gs", gsmap("stage_hunk"))
nnoremap("<Leader>gu", gsmap("undo_stage_hunk"))
nnoremap("<Leader>gr", gsmap("reset_hunk"))
nnoremap("<Leader>gR", gsmap("reset_buffer"))
nnoremap("<Leader>gp", gsmap("preview_hunk"))
nnoremap("<Leader>gb", gsmap("blame_line"))

nnoremap("[c", [[&diff ? ']c' : '<cmd>lua require"gitsigns".prev_hunk()<CR>']], {expr = true})
nnoremap("]c", [[&diff ? ']c' : '<cmd>lua require"gitsigns".next_hunk()<CR>']], {expr = true})

onoremap("ih", ":<C-U>lua require'gitsigns'.select_hunk()<CR>")
xnoremap("ih", ":<C-U>lua require'gitsigns'.select_hunk()<CR>")

-- Telescope
nnoremap("<Leader>ff", "<Cmd>Telescope find_files<CR>")
nnoremap("<Leader>fg", "<Cmd>Telescope live_grep<CR>")
nnoremap("<Leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<Leader>fh", "<Cmd>Telescope help_tags<CR>")
nnoremap("<Leader>fr", "<Cmd>Telescope registers<CR>")
nnoremap("<Leader>ft", "<Cmd>Telescope treesitter<CR>")

-- NvimTree
nnoremap("<Leader>ee",  "<Cmd>NvimTreeToggle<CR>")
nnoremap("<Leader>ef", "<Cmd>NvimTreeFindFile<CR>")

-- EasyAlign
nmap("ga", "<Plug>EasyAlign")
xmap("ga", "<Plug>EasyAlign")

-- test.vim
nnoremap("<Leader>tn", "<Cmd>TestNearest<CR>", {silent = true})
nnoremap("<Leader>tf", "<Cmd>TestFile<CR>",    {silent = true})
nnoremap("<Leader>ts", "<Cmd>TestSuite<CR>",   {silent = true})
nnoremap("<Leader>tt", "<Cmd>TestLast<CR>",    {silent = true})
nnoremap("<Leader>tv", "<Cmd>TestVisit<CR>",   {silent = true})
