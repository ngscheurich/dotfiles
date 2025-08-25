-- ===================================================================
--  Aerial
-- -------------------------------------------------------------------
--  https://github.com/stevearc/aerial.nvim
--  Code outline window
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("stevearc/aerial.nvim")

require("aerial").setup({

  on_attach = function(buffer)
    vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { buffer = buffer })
    vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { buffer = buffer })
  end,
})

vim.keymap.set("n", "<Leader>o", "<Cmd>AerialToggle!<CR>", { desc = "Outline" })
vim.keymap.set("n", "gO", function()
  require("aerial").snacks_picker()
end, { desc = "Symbols" })
