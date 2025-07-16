-- ===================================================================
--  Blink Completion
-- -------------------------------------------------------------------
--  https://cmp.saghen.dev/
--  Performant, batteries-included completion
--  completion
-- -------------------------------------------------------------------
return {
  "saghen/blink.cmp",

  version = "1.*",
  event = "VeryLazy",

  opts = {
    keymap = { preset = "enter" },
    completion = { documentation = { auto_show = false } },
    signature = { enabled = true },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        sql = { "dadbod", "snippets", "buffer" },
      },
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },

  opts_extend = { "sources.default" },
}
