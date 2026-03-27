local add = vim.pack.add
local on_filetype = Config.on_filetype

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  vim-pencil                                     │  prose                │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃   Tools that improve the prose writing experience                        │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_filetype("markdown", function()
  add({ "https://github.com/preservim/vim-pencil" })
  vim.cmd("PencilToggle")
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
