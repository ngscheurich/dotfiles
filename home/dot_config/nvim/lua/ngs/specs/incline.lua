-- ===================================================================
--  incline
-- -------------------------------------------------------------------
--  https://github.com/b0o/incline.nvim
--  Lightweight floating statuslines
--  ui
-- -------------------------------------------------------------------
return {
  "b0o/incline.nvim",

  event = "VeryLazy",

  config = function()
    local util = require("ngs.util")
    local helpers = require("incline.helpers")

    require("incline").setup({
      hide = {
        cursorline = true,
        focused_win = true,
        only_win = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local modified = vim.bo[props.buf].modified
        local icon, hl = MiniIcons.get("file", filename)
        local bg = util.get_hl_attr(hl, "fg")
        local fg = nil
        if filename == "" then
          filename = "[No Name]"
        end
        if bg and bg ~= "" then
          fg = bg and helpers.contrast_color(bg)
        end

        return {
          icon and { " ", icon, " ", guibg = bg, guifg = fg } or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
        }
      end,
    })
  end,
}
