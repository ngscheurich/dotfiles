-- ===================================================================
--  nvim-hlslens
-- -------------------------------------------------------------------
--  https://github.com/kevinhwang91/nvim-hlslens
--  Enhancements for search matches
--  workflow
-- -------------------------------------------------------------------
return {
  "kevinhwang91/nvim-hlslens",

  config = function()
    local opts = {}
    local sb_ok, sb_handler = pcall(require, "scrollbar.handlers.search")
    local hlslens = require("hlslens")

    hlslens.setup(opts)

    local start = "<Cmd>lua require('hlslens').start()<CR>"
    local next = "<Cmd>execute('normal! ' . v:count1 . 'n')<CR>" .. start
    local prev = "<Cmd>execute('normal! ' . v:count1 . 'N')<CR>" .. start

    vim.keymap.set("n", "n", next)
    vim.keymap.set("n", "N", prev)
    vim.keymap.set("n", "*", "*" .. start)
    vim.keymap.set("n", "#", "#" .. start)
    vim.keymap.set("n", "g*", "g*" .. start)
    vim.keymap.set("n", "g#", "g#" .. start)
    vim.keymap.set("n", "<Esc>", function()
      hlslens.stop()
      vim.cmd("nohlsearch")
    end)

    if sb_ok then
      opts = {
        build_position_cb = function(plist)
          sb_handler.handler.show(plist.start_pos)
        end,
      }

      vim.api.nvim_create_autocmd({ "CmdLineLeave" }, {
        group = vim.api.nvim_create_augroup("ngs.scrollbar", {}),
        callback = sb_handler.handler.hide,
      })
    end
  end,
}
