-- Blink Completion
local blink_ok, blink = pcall(require, "blink.cmp")
if blink_ok then
  blink.setup({
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
          score_offset = 100,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust" },
  })
end
