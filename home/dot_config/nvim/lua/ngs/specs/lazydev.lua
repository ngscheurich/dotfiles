-- ===================================================================
--  lazydev.nvim
-- -------------------------------------------------------------------
--  https://github.com/folke/lazydev.nvim
--  LuaLS setup for Neovim
--  workflow
-- -------------------------------------------------------------------
return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "lazy.nvim", words = { "LazyVim" } },
    },
  },
}
