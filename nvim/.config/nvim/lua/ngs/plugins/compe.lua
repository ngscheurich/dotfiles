local luasnip = require("luasnip")

local fn = vim.fn

require("compe").setup({
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    luasnip = true,
  },
  documentation = {border = "single"},
})

local function send(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_backspace()
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return true
  else
    return false
  end
end

local function tab()
  if fn.pumvisible() == 1 then
    return send("<C-n>")
  elseif luasnip.expand_or_jumpable() then
    return send("<Plug>luasnip-expand-or-jump")
  elseif check_backspace() then
    return send("<Tab>")
  else
    return fn["compe#complete"]()
  end
end

local function s_tab()
  if vim.fn.pumvisible() == 1 then
    return send("<C-p>")
  elseif luasnip.jumpable(-1) then
    return send("<Plug>luasnip-jump-prev")
  else
    return send("<S-Tab>")
  end
end

ngs.imap("<Tab>",   [[luaeval('require("config.compe").tab()')]],   {expr = true})
ngs.smap("<Tab>",   [[luaeval('require("config.compe").tab()')]],   {expr = true})
ngs.imap("<S-Tab>", [[luaeval('require("config.compe").s_tab()')]], {expr = true})
ngs.smap("<S-Tab>", [[luaeval('require("config.compe").s_tab()')]], {expr = true})

ngs.imap("<CR>", "compe#confirm('<cr>')", {expr = true})
ngs.imap("<C-Space>", "compe#complete()", {expr = true})

return {tab = tab, s_tab = s_tab}
