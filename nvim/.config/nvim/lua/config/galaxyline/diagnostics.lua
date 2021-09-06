local colors = require("iris.palette").get_color_fn

return {
  {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = {colors("red"), colors("line_base")},
    },
  },
  {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors("yellow"), colors("line_base")},
    },
  },
  {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      icon = "  ",
      highlight = {colors("cyan"), colors("line_base")},
    },
  },
  {
    DiagnosticInfo = {
      provider = "DiagnosticInfo",
      icon = "  ",
      highlight = {colors("blue"), colors("line_base")},
    },
  },
}
