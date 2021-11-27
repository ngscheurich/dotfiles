(module config.plugin.gitsigns
  {autoload {gitsigns gitsigns}})

(gitsigns.setup
  {:signs {:add         {:text :┃}
          :change       {:text :┃}
          :delete       {:text :┃}
          :topdelete    {:text :┃}
          :changedelete {:text :┃}}})
