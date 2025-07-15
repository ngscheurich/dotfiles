-- ===================================================================
--  Trouble
-- -------------------------------------------------------------------
--  https://github.com/folke/trouble.nvim
--  Interactive listing of diagnostics, references, and more
--  ui
-- -------------------------------------------------------------------
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {},

  keys = {
    {
      "<Leader>ld",
      "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Diagnostics (buffer)",
    },
    { "<Leader>lD", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
    { "<Leader>ll", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
    { "<Leader>lq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
  },
}
