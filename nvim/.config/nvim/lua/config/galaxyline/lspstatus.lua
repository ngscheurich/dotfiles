local blend = require("iris.lib.color").blend

local pal = require("iris.palette").get()

return {
  {
    LspStatus = {
      provider = function ()
        if next(vim.lsp.buf_get_clients(0)) ~= nil then
          return "   "
        end
      end,
      highlight = {pal.fg, blend(pal.bg, pal.fg, 0.75)},
    },
  },
}

