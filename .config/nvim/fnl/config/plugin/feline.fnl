(module config.plugin.galaxyline
  {autoload {a aniseed.core
             nvim aniseed.nvim
             feline feline
             mode-utils feline.providers.vi_mode
             theme config.theme}})

;; Potentially useful symbols
;;        ⮾        ❘ ❙ ❚            


(def- colors theme.colors)

(defn- mode-hl [] {:name (mode-utils.get_mode_highlight_name)
                      :fg colors.base01
                      :bg (mode-utils.get_mode_color)
                      :style :bold})

(defn- mode-hl-rev [] {:name (mode-utils.get_mode_highlight_name)
                       :fg (mode-utils.get_mode_color)
                       :bg colors.base02})

(def- left [{:provider :vi_mode
             :short_provider " "
             :icon ""
             :hl mode-hl
             :left_sep {:str " " :hl mode-hl}
             :right_sep {:str " " :hl mode-hl}}

            {:provider :file_info
             :icon ""
             :type :short-path
             :file_readonly_icon " "
             :hl {:bg colors.base02}
             :right_sep {:str " " :hl {:bg colors.base02}}}

            {:provider :git_branch
             :truncate_hide true
             :priority 2
             :icon " "
             :hl {:fg colors.base04}
             :left_sep " "
             :right_sep " "}

            {:provider :git_diff_added
             :truncate_hide true
             :icon "+"
             :hl {:fg colors.base0B}}

            {:provider :git_diff_changed
             :truncate_hide true
             :icon "~"
             :hl {:fg colors.base0D}}

            {:provider :git_diff_removed
             :truncate_hide true
             :icon "-"
             :hl {:fg colors.base08}}
            ])

(def- right [{:provider :diagnostic_errors
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.base08}
              :right_sep " "}

             {:provider :diagnostic_warnings
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.base0A}
              :right_sep " "}

             {:provider :diagnostic_hints
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.base0C}
              :right_sep " "}

             {:provider :diagnostic_info
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.base0D}
              :right_sep " "}

             {:provider :lsp_client_names
              :truncate_hide true
              :priority 1
              :hl {:fg colors.base04}
              :right_sep " "}

             {:provider (fn [] (vim.api.nvim_buf_get_option 0 :filetype))
              :hl {:fg colors.base04 :bg colors.base02}
              :left_sep {:str " " :hl {:bg colors.base02}}
              :right_sep {:str " " :hl {:bg colors.base02}}}

             {:provider :line_percentage
              :hl {:fg colors.base02 :bg colors.base04}
              :left_sep {:str " " :hl {:bg colors.base04}}
              :right_sep {:str "   " :hl {:fg colors.base02 :bg colors.base04}}}

             {:provider (fn [] (let [(row) (unpack (vim.api.nvim_win_get_cursor 0))]
                                           (string.format "%3d" row)))
              :hl {:fg colors.base02 :bg colors.base04}}

             {:provider :: :hl {:fg colors.base02 :bg colors.base04}}

             {:provider (fn [] (let [(_ col) (unpack (vim.api.nvim_win_get_cursor 0))]
                                           (string.format "%-3d" (+ col 1))))
              :hl {:fg colors.base02 :bg colors.base04}}

             ])

(def- active [left right])

(def- inactive [[{:provider :file_info
                  :hl {:fg colors.base04}}]])

(def- components {:active active :inactive inactive})

(def- mode-colors {:NORMAL    colors.base0D
                   :OP        colors.base0D
                   :INSERT    colors.base0B
                   :VISUAL    colors.base09
                   :LINES     colors.base09
                   :BLOCK     colors.base09
                   :REPLACE   colors.base08
                   :V-REPLACE colors.base08
                   :ENTER     colors.base0A
                   :MORE      colors.base0A
                   :SELECT    colors.base0A
                   :COMMAND   colors.base0C
                   :SHELL     colors.base0E
                   :TERM      colors.base0E
                   :NONE      colors.base03})

(feline.setup {:components components
               :vi_mode_colors mode-colors
               :theme {:fg colors.fg
                       :bg colors.base01}})
