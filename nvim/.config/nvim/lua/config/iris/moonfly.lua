local core = {
  base00 = "#151515",
  base01 = "#1e1e1e",
  base02 = "#222222",
  base03 = "#333333",
  base04 = "#c6c6c6",
  base05 = "#c6c6c6",
  base06 = "#c6c6c6",
  base07 = "#c6c6c6",
  base08 = "#ff5454",
  base09 = "#f09479",
  base0A = "#e3c78a",
  base0B = "#8cc85f",
  base0C = "#79dac8",
  base0D = "#80a0ff",
  base0E = "#d183e8",
  base0F = "#de935f",
}

return vim.tbl_extend("error", core, {
  gutter = "#1c1c1c",
  cursorline = "#202020",
})
