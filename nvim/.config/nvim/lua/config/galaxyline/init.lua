local galaxyline = require("galaxyline")
local section = galaxyline.section

local function add_components(location, name)
  local components = require("config.galaxyline." .. name)
  for _, component in ipairs(components) do
    table.insert(section[location], component)
  end
end

galaxyline.short_line_list = {"NvimTree", "Trouble", "dirvish", "vista"}

add_components("left", "mode")
add_components("left", "fileinfo")
add_components("left", "diagnostics")

add_components("right", "diff")
add_components("right", "git")
add_components("right", "position")

add_components("short_line_left", "short_left")
add_components("short_line_right", "short_right")
