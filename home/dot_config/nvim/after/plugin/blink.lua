-- ===================================================================
--  Blink Completion
-- -------------------------------------------------------------------
--  https://cmp.saghen.dev/
--  Performant, batteries-included completion
--  completion
-- -------------------------------------------------------------------
MiniDeps.add({
  source = "saghen/blink.cmp",
  checkout = "v1.6.0",
})

require("blink.cmp").setup({
  keymap = { preset = "enter" },
  completion = { documentation = { auto_show = false } },
  signature = { enabled = true },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      -- sql = { "dadbod", "snippets", "buffer" },
    },
    providers = {
      -- dadbod = {
      -- 	name = "Dadbod",
      -- 	module = "vim_dadbod_completion.blink",
      -- 	score_offset = 100,
      -- },
    },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },
})
