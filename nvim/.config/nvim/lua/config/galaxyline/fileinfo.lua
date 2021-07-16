local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.provider_fileinfo")
local colors = require("iris.palette").get_color_fn

return {
  {
    FileInfoSeparator = {
      provider = function() return " " end,
      highlight = {"NONE", colors("line_lite")},
    },
  },
  {
    FileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, colors("line_lite")},
    },
  },
  {
    FileName = {
      provider = "FileName",
      condition = condition.buffer_not_empty,
      highlight = {colors("white"), colors("line_lite")},
      separator = " ",
      separator_highlight = {"NONE", colors("line_lite")},
    },
  },
}
