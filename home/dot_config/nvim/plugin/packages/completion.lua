-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Blink Completion                               │  completion         │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Performant, batteries-included completion                             │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "saghen/blink.cmp",
    checkout = "v1.6.0",
  })

  require("blink.cmp").setup(
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    {
      completion = {
        documentation = { auto_show = false },
        ghost_text = { enabled = false },
        menu = {
          draw = {
            padding = { 1, 1 },
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
              kind = {
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
      },

      fuzzy = { implementation = "prefer_rust" },

      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
      },

      signature = { enabled = true },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "dadbod", "snippets", "buffer" },
        },
        providers = {
          buffer = {
            min_keyword_length = 5,
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
            score_offset = 100,
          },
        },
      },
    }
  )
end)
