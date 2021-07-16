local cmp = require("cmp")

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function feedkey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local function on_tab(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn["vsnip#available"]() == 1 then
    feedkey("<Plug>(vsnip-expand-or-jump)", "")
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local function on_s_tab()
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    feedkey("<Plug>(vsnip-jump-prev)", "")
  end
end

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
    ["<Tab>"] = cmp.mapping(on_tab, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(on_s_tab, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  },
  snippet = {
    expand = function (args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
})

-- TODO: Check on all these options
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
