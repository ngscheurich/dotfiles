local autopairs = require('nvim-autopairs')
local endwise = require("nvim-autopairs.ts-rule").endwise

autopairs.setup()

autopairs.add_rules({
  endwise("then$", "end", "lua", "if_statement"),
})
