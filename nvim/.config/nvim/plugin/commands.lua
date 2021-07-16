-- =========================================================
-- Commands
-- =========================================================

local command = ngs.vim.command

-- Plugin management
command("PackerInstall", "lua require('ngs.packages').install()")
command("PackerCompile", "lua require('ngs.packages').compile()")
command("PackerUpdate",  "lua require('ngs.packages').update()")
command("PackerClean",   "lua require('ngs.packages').clean()")
command("PackerSync",    "lua require('ngs.packages').sync()")
command("PackerGet",     "lua require('ngs.util').get_packer()")

-- Utilities
command("SyntaxInspect", "lua ngs.inspect(ngs.get_syntax_item())")
command("SyntaxShow", "lua print(ngs.identify_syntax_item())")
