-- =========================================================
-- Mappings
-- =========================================================

-- Navigate window splits with the arrow keys
ngs.nnoremap("<Left>",  "<C-w>h")
ngs.nnoremap("<Down>",  "<C-w>j")
ngs.nnoremap("<Up>",    "<C-w>k")
ngs.nnoremap("<Right>", "<C-w>l")

-- Resize splits with meta + the arrow keys
ngs.nnoremap("<M-Up>",    "<Cmd>resize +10<CR>")
ngs.nnoremap("<M-Down>",  "<Cmd>resize -10<CR>")
ngs.nnoremap("<M-Right>", "<Cmd>vertical resize +10<CR>")
ngs.nnoremap("<M-Left>",  "<Cmd>vertical resize -10<CR>")

-- Clear search highlighting on <Esc>
ngs.nnoremap("<Esc>", "<Cmd>nohlsearch<CR>")

-- Yank until the end of the line
ngs.nnoremap("Y", "y$")

-- Window managemnet
ngs.nnoremap("<Leader>wq", "<Cmd>q<CR>")
ngs.nnoremap("<Leader>ws", "<Cmd>split<CR>")
ngs.nnoremap("<Leader>wv", "<Cmd>vsplit<CR>")
ngs.nnoremap("<Leader>wo", "<C-w>o")
ngs.nnoremap("<Leader>w=", "<C-w>=")

-- Buffer management
ngs.nnoremap("<Leader>bd", "<Cmd>bdelete<CR>")
ngs.nnoremap("<Leader>bh", "<Cmd>Startify<CR>")
ngs.nnoremap("<Leader>bn", "<Cmd>bnext<CR>")
ngs.nnoremap("<Leader>bp", "<Cmd>bprevious<CR>")

-- Toggles
ngs.nnoremap("<Leader>un", "<Cmd>lua require('ngs.util').toggle_line_numbers()<CR>")
ngs.nnoremap("<Leader>us", "<Cmd>lua require('ngs.util').toggle_sign_column()<CR>")
