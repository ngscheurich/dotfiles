(module config.plugin.icons
  {autoload {icons nvim-web-devicons}})

(icons.setup
  {:override
   {:NvimTree {:icon ""}
    :dirvish {:icon ""}
    :erlang {:color "#A1022B"}
    :quickfix {:icon ""}
    :text {:icon ""}
    :zsh {:icon ""}}})
