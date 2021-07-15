local colors = require("iris.palette").get_color_fn

local highlight = {colors("base05"), colors("line_base")}

return {
  {
    SLineColumn = {
      provider = "LineColumn", highlight = highlight},
  },
  {
    SLinePercent = {
      provider = "LinePercent",
      highlight = highlight,
      separator = " ",
      separator_highlight = highlight,
    },
  },
}
