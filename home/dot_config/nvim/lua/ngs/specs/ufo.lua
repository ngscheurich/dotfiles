-- ===================================================================
--  nvim-ufo
-- -------------------------------------------------------------------
--  https://github.com/kevinhwang91/nvim-ufo
--  High-performance folds with a modern look
--  ui
-- -------------------------------------------------------------------
return {
  "kevinhwang91/nvim-ufo",

  dependencies = { "kevinhwang91/promise-async" },

  config = function()
    vim.o.foldmethod = "manual"
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

    require("ufo").setup()
  end,
}
