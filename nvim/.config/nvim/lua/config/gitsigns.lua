require("gitsigns").setup({
  signs = {
    add          = {text = '┃'},
    change       = {text = '┃'},
    delete       = {text = '┃'},
    topdelete    = {text = '┃'},
    changedelete = {text = '┃'},
  },
  keymaps = {},
})

-- General functionality
local function gsmap(fn)
  return '<Cmd>lua require("gitsigns").'..fn.."()<CR>"
end

ngs.nnoremap("<Leader>gs", gsmap("stage_hunk"))
ngs.nnoremap("<Leader>gu", gsmap("undo_stage_hunk"))
ngs.nnoremap("<Leader>gr", gsmap("reset_hunk"))
ngs.nnoremap("<Leader>gR", gsmap("reset_buffer"))
ngs.nnoremap("<Leader>gp", gsmap("preview_hunk"))
ngs.nnoremap("<Leader>gb", gsmap("blame_line"))

-- UI toggles
ngs.nnoremap("<Leader>ugs", "<Cmd>Gitsigns toggle_signs<CR>")
ngs.nnoremap("<Leader>ugb", "<Cmd>Gitsigns toggle_current_line_blame<CR>")

-- Motions
ngs.nnoremap("[c", [[&diff ? ']c' : '<cmd>lua require"gitsigns".prev_hunk()<CR>']], {expr = true})
ngs.nnoremap("]c", [[&diff ? ']c' : '<cmd>lua require"gitsigns".next_hunk()<CR>']], {expr = true})

-- Text objects
ngs.onoremap("ih", ":<C-U>lua require'gitsigns'.select_hunk()<CR>")
ngs.xnoremap("ih", ":<C-U>lua require'gitsigns'.select_hunk()<CR>")
