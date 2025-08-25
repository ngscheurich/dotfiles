-- ===================================================================
--  tiny-glimmer.nvim
-- -------------------------------------------------------------------
--  https://github.com/rachartier/tiny-glimmer.nvim
--  Adds subtle animations to some operations
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("rachartier/tiny-glimmer.nvim")

require("tiny-glimmer").setup({
  overwrite = {
    search = { enabled = true },
    undo = { enabled = true },
    redo = { enabled = true },
  },
})
