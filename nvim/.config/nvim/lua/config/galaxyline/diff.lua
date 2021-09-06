local condition = require("galaxyline.condition")
local colors = require("iris.palette").get_color_fn

return {
  {
    DiffAdd = {
      provider = "DiffAdd",
      condition = condition.hide_in_width,
      icon = " +",
      highlight = {colors("add"), colors("line_base")},
    },
  },
  {
    DiffModified = {
      provider = "DiffModified",
      condition = condition.hide_in_width,
      icon = " •",
      highlight = {colors("change"), colors("line_base")},
    },
  },
  {
    DiffRemove = {
      provider = "DiffRemove",
      condition = condition.hide_in_width,
      icon = " -",
      highlight = {colors("delete"), colors("line_base")},
    },
  },
}
