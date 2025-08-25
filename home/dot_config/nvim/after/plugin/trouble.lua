-- ===================================================================
--  Trouble
-- -------------------------------------------------------------------
--  https://github.com/folke/trouble.nvim
--  Interactive listing of diagnostics, references, and more
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("folke/trouble.nvim")

local function trouble_map(lhs, rhs, opts)
  if not package.loaded["trouble"] then
    require("trouble").setup()
  end
  vim.keymap.set("n", lhs, rhs, opts)
end

trouble_map("<Leader>ld", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (buffer)" })
trouble_map("<Leader>lD", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
trouble_map("<Leader>ll", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
trouble_map("<Leader>lq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
