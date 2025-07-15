-- ===================================================================
--  copilot.lua
-- -------------------------------------------------------------------
--  https://github.com/zbirenbaum/copilot.lua
--  GitHub Copilot integration
--  generative-ai
-- -------------------------------------------------------------------
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  cond = false,

  config = function()
    local copilot = require("copilot")
    copilot.setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,

  keys = {
    { "<Leader>aC", "<Cmd>Copilot toggle<CR>", desc = "Copilot (toggle)" },
  },
}
