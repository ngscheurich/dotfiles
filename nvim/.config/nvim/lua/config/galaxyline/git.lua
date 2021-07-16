local condition = require("galaxyline.condition")
local colors = require("iris.palette").get_color_fn

local function ch_shorten(branch)
  return string.match(branch, [[^.+/(ch%d+)/.*]])
end

return {
  {
    GitIcon = {
      provider = function() return "  " end,
      highlight = {"NONE", colors("line_base")},
    }
  },
  {
    GitBranch = {
      provider = function()
        if not vim.fn.exists("g:loaded_fugitive") then
          return ""
        end
        local head = vim.fn["fugitive#Head"]()
        if head then
          local o = ch_shorten(head) or head
          return o.." "
        end
      end,
      condition = condition.check_git_workspace,
      highlight = {colors("white"), colors("line_base")},
    }
  }
}
