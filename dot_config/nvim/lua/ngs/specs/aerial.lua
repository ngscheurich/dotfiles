-- ===================================================================
--  Aerial
-- -------------------------------------------------------------------
--  https://github.com/stevearc/aerial.nvim
--  Code outline window
--  ui
-- -------------------------------------------------------------------
return {
  "stevearc/aerial.nvim",

  config = function()
    require("aerial").setup({
      on_attach = function(buffer)
        vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { buffer = buffer })
        vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { buffer = buffer })
      end,
    })
  end,

  keys = {
    { "<Leader>o", mode = { "n" }, "<Cmd>AerialToggle!<CR>", desc = "Outline" },
    {
      "gO",
      mode = { "n" },
      function()
        require("aerial").snacks_picker()
      end,
      desc = "Symbols",
    },
  },
}
