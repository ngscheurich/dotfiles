vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Rebuild the status line when the color scheme changes",
  group = vim.api.nvim_create_augroup("ngs.colorscheme", {}),
  callback = function()
    require("ngs.specs.heirline").config()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Change the appearance of special windows",
  group = vim.api.nvim_create_augroup("ngs.filetype", {}),
  pattern = "codecompanion",
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalAlt"
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Change the background of terminal buffers",
  group = vim.api.nvim_create_augroup("ngs.term", {}),
  pattern = "*",
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalAlt"
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Update nvim-treesitter",
  group = vim.api.nvim_create_augroup("ngs.packages.update", {}),
  callback = function(event)
    local kind, name = event.data.kind, event.data.spec.name
    if kind == "update" and name == "nvim-treesitter" then
      require("nvim-treesitter")
      vim.cmd("TSUpdate")
    end
  end,
})
