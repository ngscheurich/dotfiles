local blend = require("iris.lib.color").blend

local pal = {
  base00 = "#161821",
  base01 = "#161821",
  base02 = "#1e2132",
  base03 = "#1e2132",
  base04 = "#6b7089",
  base05 = "#c6c8d1",
  base06 = "#c6c8d1",
  base07 = "#c6c8d1",
  base08 = "#e27878",
  base09 = "#e2a478",
  base0A = "#e9b189",
  base0B = "#b4be82",
  base0C = "#89b8c2",
  base0D = "#84a0c6",
  base0E = "#a093c7",
  base0F = "#e98989",
}

return vim.tbl_extend("error", pal, {
  gutter     = pal.base02,
  cursorline = blend(pal.base00, pal.base02, 0.5),
  line_base = "#0f1117",
  line_dark = "#08090c",
  line_lite = "#212531",
})
