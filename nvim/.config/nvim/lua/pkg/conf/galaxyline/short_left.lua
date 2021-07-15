local condition = require("galaxyline.condition")
local colors = require("iris.palette").get_color_fn

local highlight = {colors("base05"), colors("line_base")}

return {
  {
    SLeftPad = {
      provider = function() return " " end,
      highlight = highlight,
    },
  },
  {
    SFileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = highlight,
    },
  },
  {
    SFileName = {
      provider = "FileName",
      condition = condition.buffer_not_empty,
      highlight = highlight,
    },
  },
}
