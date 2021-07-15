local map = require("ngs.util").map
local fn = vim.fn

require("compe").setup({
  min_length = 1,
  documentation = {
    border = "single",
  },
  source = {
    path = true,
    buffer = true,
    tag = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
  },
})

local function send(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function tab()
  if fn.pumvisible() == 1 then
    return send("<C-n>")
  elseif fn.call("vsnip#available", {1}) == 1 then
    return send("<Plug>(vsnip-expand-or-jump)")
  else
    return send("<Tab>")
  end
end

local function s_tab()
  if fn.pumvisible() == 1 then

    return send("<C-p>")
  elseif fn.call("vsnip#jumpable", {-1}) == 1 then
    return send("<Plug>(vsnip-jump-prev)")
  else
    return send("<S-Tab>")
  end
end

require("nvim-autopairs.completion.compe").setup()

map("i", "<Tab>",   [[luaeval('require("pkg.conf.compe").tab()')]],   {expr = true, noremap = false})
map("s", "<Tab>",   [[luaeval('require("pkg.conf.compe").tab()')]],   {expr = true, noremap = false})
map("i", "<S-Tab>", [[luaeval('require("pkg.conf.compe").s_tab()')]], {expr = true, noremap = false})
map("s", "<S-Tab>", [[luaeval('require("pkg.conf.compe").s_tab()')]], {expr = true, noremap = false})

return {tab = tab, s_tab = s_tab}
