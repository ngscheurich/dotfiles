-- ===================================================================
--  bufferline.nvim
-- -------------------------------------------------------------------
--  https://github.com/akinsho/bufferline.nvim
--  A bufferline to display tabs
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("akinsho/bufferline.nvim")

vim.api.nvim_create_autocmd({ "TabEnter", "TabNew", "TabNewEntered" }, {
  desc = "Load bufferline.nvim",
  group = vim.api.nvim_create_augroup("ngs.packges.bufferline", {}),
  callback = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        indicator = { icon = "┃" },
      },
    })
  end,
})
