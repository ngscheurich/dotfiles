local condition = require("galaxyline.condition")
-- local fileinfo = require("galaxyline.provider_fileinfo")
-- local colors = require("iris.palette").get_color_fn

return {
  -- {
  --   FileInfoSeparator = {
  --     provider = function () return " " end,
  --     highlight = {"NONE", colors("line_lite")},
  --   },
  -- },
  {
    FileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      separator = " ",
    },
  },
  {
    FileName = {
      provider = "FileName",
      condition = condition.buffer_not_empty,
      separator = " ",
    },
  },
}
