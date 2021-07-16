-- =========================================================
-- Commands
-- =========================================================

-- Plugin management
ngs.lua_command("PackerInstall", "ngs.plugins", "install")
ngs.lua_command("PackerCompile", "ngs.plugins", "compile")
ngs.lua_command("PackerUpdate", "ngs.plugins", "update")
ngs.lua_command("PackerClean", "ngs.plugins", "clean")
ngs.lua_command("PackerSync", "ngs.plugins", "sync")
ngs.lua_command("PackerGet", "ngs.util", "get_packer")
