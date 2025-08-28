-- vim-dadbod-ui
vim.g.db_ui_use_nerd_fonts = 1

-- kulala.nvim
vim.api.nvim_create_autocmd("FileType", {
  desc = "Load kulala.nvim",
  group = vim.api.nvim_create_augroup("ngs.packages.kulala", {}),
  pattern = { "http", "rest" },
  callback = function()
    if not package.loaded["kulala"] then
      local kulala_ok, kulala = pcall(require, "kulala")
      if kulala_ok then
        kulala.setup()
      end
    end
  end,
})
