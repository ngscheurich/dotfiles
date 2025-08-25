-- ===================================================================
--  Fidget
-- -------------------------------------------------------------------
--  https://github.com/j-hui/fidget.nvim
--  Extensible UI for Neovim notifications and LSP progress messages
--  ui
-- -------------------------------------------------------------------
MiniDeps.add("j-hui/fidget.nvim")

vim.api.nvim_create_autocmd("LspProgress", {
  desc = "Load Fidget",
  group = vim.api.nvim_create_augroup("ngs.packages.fidget", {}),
  callback = function()
    if not package.loaded["fidget"] then
      require("fidget").setup({
        progress = {
          display = { done_icon = "" },
        },
      })
    end
  end,
})
