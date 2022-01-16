(module config.plugin.lualine
  {autoload {ll lualine}})

(ll.setup
  {:options {:theme :tokyonight
             :component_separators {:left "" :right ""}
             :section_separators {:left "" :right ""}}

   :sections {:lualine_a [:mode]
              :lualine_b [:branch]
              :lualine_c [[:filename {:colored false}]]
              :lualine_x []
              :lualine_y [[:diagnostics {:sources [:nvim_lsp]}] :filetype]
              :lualine_z ["%l  %c ☰ %p%%"]}

   :extensions [:quickfix :nvim-tree]})
