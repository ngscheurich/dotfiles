-- =========================================================
-- Commands
-- =========================================================

local fncommand = ngs.fncommand

-- Plugin management
fncommand("PackerInstall", "ngs.plugins", "install")
fncommand("PackerCompile", "ngs.plugins", "compile")
fncommand("PackerUpdate", "ngs.plugins", "update")
fncommand("PackerClean", "ngs.plugins", "clean")
fncommand("PackerSync", "ngs.plugins", "sync")
fncommand("PackerGet", "ngs.util", "get_packer")
