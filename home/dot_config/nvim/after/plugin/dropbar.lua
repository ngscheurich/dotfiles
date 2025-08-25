-- ===================================================================
--  dropbar.nvim
-- -------------------------------------------------------------------
--  https://github.com/Bekaboo/dropbar.nvim
--  Document breadcrumbs bar
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("Bekaboo/dropbar.nvim")

require("dropbar").setup({
  bar = { enable = false },
})

vim.keymap.set("n", "<Leader>tb", function()
  if vim.o.winbar == "" then
    vim.opt.winbar = "%{%v:lua.dropbar()%}"
  else
    vim.opt.winbar = ""
  end
end, { desc = "Breadcrumbs" })
