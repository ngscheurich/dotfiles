local cmp = require("cmp")

cmp.setup({
  sources = {
    {name = "nvim_lsp", keyword_length = 3},
    {name = "buffer", keyword_length = 6},
    {name = "vsnip"},
  },
  formatting = {
    format = require("lspkind").cmp_format(),
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  },
  snippet = {
    expand = function (args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
})
