-- peek.nvim
local peek_ok, peek = pcall(require, "peek")
if peek_ok then
  peek.setup()
  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end

-- Markview.nvim
vim.api.nvim_create_autocmd("FileType", {
  desc = "Load Markview",
  group = vim.api.nvim_create_augroup("ngs.packages.markview", {}),
  pattern = { "markdown", "typst", "latex", "yaml" },
  callback = function()
    if not package.loaded["markview"] then
      local markview_ok, markview = pcall(require, "markview")
      if markview_ok then
        markview.setup({
          experimental = { check_rtp_message = false },
        })
      end
    end
  end,
})
