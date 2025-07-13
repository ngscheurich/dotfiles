-- Based on Tomorrow (https://github.com/chriskempson/tomorrow-theme)

local color_overrides = {
  -- stylua: ignore start
  mocha = {
    rosewater = "#ab7c70",
    flamingo  = "#8d594c",
    pink      = "#8957a8",
    mauve     = "#d84673",
    red       = "#c82829",
    maroon    = "#aa2223",
    peach     = "#c88828",
    yellow    = "#eab700",
    green     = "#718c00",
    teal      = "#57ab00",
    sky       = "#3e999f",
    sapphire  = "#368388",
    blue      = "#82a2be",
    lavender  = "#8e81d0",

    text      = "#282a2e",
    subtext1  = "#373b41",
    subtext0  = "#4a4e52",
    overlay2  = "#5e6063",
    overlay1  = "#717374",
    overlay0  = "#838585",
    surface2  = "#969896",
    surface1  = "#b5b7b4",
    surface0  = "#cfd0ce",
    base      = "#e9e9e8",
    mantle    = "#f5f5f5",
    crust     = "#fdfdfd",
  },
  -- stylua: ignore end
}

return {
  apply = function(setup)
    setup({
      color_overrides = color_overrides,
      integrations = { aerial = true, blink_cmp = true },
    })

    vim.cmd.colorscheme("catppuccin")
    vim.cmd.hi("FloatBorder guifg=" .. color_overrides.mocha.surface2)
    vim.cmd.hi("SnacksPicker guibg=" .. color_overrides.mocha.base)
    vim.cmd.hi(
      string.format(
        "SnacksPickerBorder guifg=%s guibg=%s",
        color_overrides.mocha.surface2,
        color_overrides.mocha.base
      )
    )
    vim.cmd.hi("NormalAlt guibg=" .. color_overrides.mocha.mantle)

    local light_bg = {
      "CursorLineNr",
      "GitGutterAdd",
      "GitGutterChange",
      "GitGutterChangeDelete",
      "GitGutterDelete",
      "LineNr",
      "SignColumn",
    }
    for _, group in ipairs(light_bg) do
      vim.cmd(string.format("hi %s guibg=#212326", group))
    end
  end,
}
