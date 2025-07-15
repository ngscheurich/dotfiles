local colors_group = vim.api.nvim_create_augroup("ngs.colors", {})

vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Rebuild the status line when the color scheme changes",
  group = colors_group,
  callback = function()
    require("ngs.specs.heirline").config()
  end,
})

local ft_group = vim.api.nvim_create_augroup("ngs.filetypes", {})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Change the appearance of special windows",
  group = ft_group,
  pattern = "codecompanion",
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalDark"
  end,
})

local term_group = vim.api.nvim_create_augroup("ngs.term", {})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Change the background of terminal buffers",
  group = term_group,
  pattern = "*",
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalDark"
  end,
})
