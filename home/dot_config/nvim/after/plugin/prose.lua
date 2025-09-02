-- peek.nvim
local peek_ok, peek = pcall(require, "peek")
if peek_ok then
  peek.setup()
  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end

-- render-markdown.md
vim.api.nvim_create_autocmd("FileType", {
  desc = "Load render-markdown.md",
  group = vim.api.nvim_create_augroup("ngs.packages.render_markdown", {}),
  pattern = { "markdown" },
  callback = function()
    if not package.loaded["render-markdown"] then
      local render_md_ok, render_md = pcall(require, "render-markdown")
      if render_md_ok then
        render_md.setup()
      end
    end
  end,
})
