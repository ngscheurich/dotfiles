require("lualine").setup({
  options = {
    theme = "tokyonight",
    icons_enabled = true,
    section_separators = {"", ""},
    component_separators = {"", ""}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      {"filetype", colored = true},
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  extensions = {
    "quickfix",
    "fugitive",
    "nvim-tree",
  },
})
