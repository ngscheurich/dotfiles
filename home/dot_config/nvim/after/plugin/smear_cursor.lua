-- ===================================================================
--  smear-cursor.nvim
-- -------------------------------------------------------------------
--  https://github.com/sphamba/smear-cursor.nvim
--  Animates the cursor with a smear effect
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("sphamba/smear-cursor.nvim")

require("smear_cursor").setup({
  smear_to_cmd = false,
})
