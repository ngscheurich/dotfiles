-- ===================================================================
--  tiny-glimmer.nvim
-- -------------------------------------------------------------------
--  https://github.com/rachartier/tiny-glimmer.nvim
--  Adds subtle animations to some operations
--  ui
-- -------------------------------------------------------------------
return {
  "rachartier/tiny-glimmer.nvim",

  opts = {
    overwrite = {
      search = { enabled = true },
      undo = { enabled = true },
      redo = { enabled = true },
    },
  },
}
