-- ===================================================================
--  Gitsigns
-- -------------------------------------------------------------------
--  https://github.com/lewis6991/gitsigns.nvim
--  Git integration for buffers
--  source-control
-- -------------------------------------------------------------------
MiniDeps.add({
  source = "lewis6991/gitsigns.nvim",
  depends = { "petertriho/nvim-scrollbar" },
})

local gs = require("gitsigns")

gs.setup({
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    changedelete = { text = "┃" },
    delete = { text = "┃" },
    topdelete = { text = "┃" },
    untracked = { text = "┇" },
  },
})

vim.keymap.set("n", "<Leader>gb", gs.toggle_current_line_blame, { desc = "Line blame (toggle)" })
vim.keymap.set("n", "<Leader>gd", gs.toggle_deleted, { desc = "Deleted (toggle)" })
vim.keymap.set("n", "<Leader>gh", gs.toggle_linehl, { desc = "Line highlight (toggle)" })
vim.keymap.set("n", "<Leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<Leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous hunk" })
