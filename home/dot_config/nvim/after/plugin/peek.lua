-- ===================================================================
--  peek.nvim
-- -------------------------------------------------------------------
--  https://github.com/toppair/peek.nvim/tree/master
--  Live Markdown previewer
--  prose
-- -------------------------------------------------------------------
MiniDeps.add({
  source = "toppair/peek.nvim",
  hooks = {
    post_checkout = function()
      vim.system({ "deno", "task", "--quiet build:fast" })
    end,
  },
})

require("peek").setup()

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
