local add = vim.pack.add
local on_filetype = Config.on_filetype

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  vim-pencil                                     │  prose                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃   Tools that improve the prose writing experience                        │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_filetype("markdown,text", function()
  add({ "https://github.com/preservim/vim-pencil" })
  vim.fn["pencil#init"]()
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  render-markdown.nvim                           │  prose                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃   Improves Markdown document rendering                                   │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_filetype(
  "markdown",
  function()
    add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
  end
)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  peek.nvim                                      │  prose                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃   Live Markdown preview                                                  │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_filetype("markdown", function()
  add({ "https://github.com/toppair/peek.nvim" })
  require("peek").setup({
    theme = "light",
    app = "browser",
  })
  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  -- local result = vim
  --   .system({ "deno", "task", "--quiet", "build:fast" }, { text = true })
  --   :wait()

  -- Config.autocmd("PackChanged", "*", function(ev) vim.print(ev) end, "test")

  -- vim.api.nvim_create_autocmd("PackChanged", {
  --   callback = function(ev)
  --     vim.notify("A package changed")
  --     vim.print(ev)
  --   end,
  --   desc = "Test for PackChanged event",
  -- })
end)
