-- =========================================================
-- Commands
-- =========================================================

local command, fncommand = ngs.command, ngs.fncommand

-- Plugin management
fncommand("PackerInstall", "ngs.plugins", "install")
fncommand("PackerCompile", "ngs.plugins", "compile")
fncommand("PackerUpdate", "ngs.plugins", "update")
fncommand("PackerClean", "ngs.plugins", "clean")
fncommand("PackerSync", "ngs.plugins", "sync")
fncommand("PackerGet", "ngs.util", "get_packer")

-- Silent grep
command("Grep", "Grep", "1")
