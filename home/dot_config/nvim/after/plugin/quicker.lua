-- ===================================================================
--  quicker.nvim
-- -------------------------------------------------------------------
--  https://github.com/stevearc/quicker.nvim
--  Improved UI and workflow for the quickfix list
--  workflow
-- -------------------------------------------------------------------
MiniDeps.add("stevearc/quicker.nvim")

vim.api.nvim_create_autocmd("FileType", {
  desc = "Load quicker.nvim",
  group = vim.api.nvim_create_augroup("ngs.packages.quicker", {}),
  pattern = "qf",
  callback = function()
    if not package.loaded["quicker"] then
      require("quicker").setup()
    end
  end,
})
