vim.g["test#strategy"] = "floaterm"

local opts = {silent = true}

ngs.nnoremap("<Leader>tn", "<Cmd>TestNearest<CR>", opts)
ngs.nnoremap("<Leader>tf", "<Cmd>TestFile<CR>", opts)
ngs.nnoremap("<Leader>ts", "<Cmd>TestSuite<CR>", opts)
ngs.nnoremap("<Leader>tt", "<Cmd>TestLast<CR>", opts)
ngs.nnoremap("<Leader>tv", "<Cmd>TestVisit<CR>", opts)
