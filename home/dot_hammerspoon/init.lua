hs.alert.show("Config loaded")

local hyper = { "shift", "ctrl", "alt", "cmd" }
local opt_cmd = { "option", "cmd" }

-- Reload config
hs.hotkey.bind(hyper, "r", function()
  hs.reload()
end)

-- Special character
hs.hotkey.bind(hyper, "-", function()
  hs.eventtap.keyStrokes("—")
end)

hs.hotkey.bind(hyper, "=", function()
  hs.eventtap.keyStrokes("–")
end)

hs.hotkey.bind(hyper, ";", function()
  hs.eventtap.keyStrokes("‘")
end)

hs.hotkey.bind(hyper, "'", function()
  hs.eventtap.keyStrokes("’")
end)

hs.hotkey.bind(hyper, "[", function()
  hs.eventtap.keyStrokes("“")
end)

hs.hotkey.bind(hyper, "]", function()
  hs.eventtap.keyStrokes("”")
end)

-- Window switching
hs.hints.fontName = "Lilex"
hs.hints.iconAlpha = 0
hs.hints.fontSize = 24
hs.hints.showTitleThresh = 0

hs.hotkey.bind(opt_cmd, "w", function()
  hs.hints.windowHints()
end)

-- Application switching
hs.hotkey.bind(opt_cmd, "b", function()
  hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind(opt_cmd, "f", function()
  hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind(opt_cmd, "m", function()
  hs.application.launchOrFocus("Music")
end)

hs.hotkey.bind(opt_cmd, "n", function()
  hs.application.launchOrFocus("Obsidian")
end)

hs.hotkey.bind(opt_cmd, "s", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(opt_cmd, "t", function()
  hs.application.launchOrFocus("Ghostty")
end)
