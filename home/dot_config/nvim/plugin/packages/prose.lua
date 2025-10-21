-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  peek.nvim                                      │  prose              │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Live Markdown previewer                                               │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "toppair/peek.nvim",
    hooks = {
      post_checkout = function()
        vim.system({ "deno", "task", "--quiet", "build:fast" })
      end,
    },
  })

  local peek = require("peek")
  peek.setup()
  vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
  vim.api.nvim_create_user_command("PeekClose", peek.close, {})
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  render-markdown.nvim                           │  prose              │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Enhances Markdown-viewing experience                                  │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add("MeanderingProgrammer/render-markdown.nvim")

  vim.api.nvim_create_autocmd("FileType", {
    desc = "Load render-markdown.md",
    group = vim.api.nvim_create_augroup("ngs.packages.render_markdown", {}),
    pattern = { "markdown" },
    callback = function()
      if not package.loaded["render-markdown"] then
        require("render_md").setup()
      end
    end,
  })
end)
