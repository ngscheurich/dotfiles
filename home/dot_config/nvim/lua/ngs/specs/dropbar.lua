-- ===================================================================
--  dropbar.nvim
-- -------------------------------------------------------------------
--  https://github.com/Bekaboo/dropbar.nvim
--  Document breadcrumbs bar
--  ui
-- -------------------------------------------------------------------
return {
  "Bekaboo/dropbar.nvim",

  opts = {
    bar = { enable = false },
  },

  keys = {
    {
      "<Leader>ub",
      mode = { "n" },
      function()
        if vim.o.winbar == "" then
          vim.opt.winbar = "%{%v:lua.dropbar()%}"
        else
          vim.opt.winbar = ""
        end
      end,
      desc = "Breadcrumbs",
    },
  },
}
