-- =========================================================
-- Commands
-- =========================================================

local command, fncommand = ngs.command, ngs.fncommand

-- Plugin management
fncommand("PackerInstall", "plugins", "install")
fncommand("PackerCompile", "plugins", "compile")
fncommand("PackerUpdate", "plugins", "update")
fncommand("PackerClean", "plugins", "clean")
fncommand("PackerSync", "plugins", "sync")
fncommand("PackerGet", "ngs.util", "get_packer")

-- Utilities
command("SyntaxInspect", "lua ngs.inspect(ngs.get_syntax_item())")
command("SyntaxShow", "lua print(ngs.identify_syntax_item())")
