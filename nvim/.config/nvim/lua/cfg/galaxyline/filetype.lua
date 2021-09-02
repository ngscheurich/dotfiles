local blend = require("iris.lib.color").blend

local pal = require("iris.palette").get()

return {
  {
    FileType = {
      provider = function ()
        local ft = vim.api.nvim_buf_get_option(0, "filetype")
        if ft == nil or ft == "" then return "" end
        return "  " .. ft .. " "
      end,
      highlight = {pal.fg, blend(pal.bg, pal.fg, 0.75)},
    },
  },
}
