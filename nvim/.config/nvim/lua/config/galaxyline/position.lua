local colors = require("iris.palette").get_color_fn

local highlight = {colors("white"), colors("line_lite")}

return {
  {
    LineColumn = {
      provider = "LineColumn",
      highlight = highlight,
      separator = " ",
      separator_highlight = highlight,
    },
  },
  {
    LineColumnIcon = {
      provider = function() return "  " end,
      highlight = highlight,
    },
  },
  {
    LinePercent = {
      provider = "LinePercent",
      highlight = highlight,
      separator = " ",
      separator_highlight = highlight,
    },
  },
  {
    LinePercentIcon = {
      provider = function() return " ☰ " end,
      highlight = highlight,
    },
  },
}
