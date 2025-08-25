-- ===================================================================
--  nvim-ufo
-- -------------------------------------------------------------------
--  https://github.com/kevinhwang91/nvim-ufo
--  High-performance folds with a modern look
--  ui
-- -------------------------------------------------------------------
MiniDeps.add({
  source = "kevinhwang91/nvim-ufo",
  depends = { "kevinhwang91/promise-async" },
})

vim.opt.foldmethod = "manual"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

require("ufo").setup()

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
