(module config.plugin.galaxyline
  {autoload {a aniseed.core
             feline feline
             mode-utils feline.providers.vi_mode
             tn-colors tokyonight.colors
             tn-utils tokyonight.util}})

;; Potentially useful symbols
;;        ⮾        ❘ ❙ ❚            

(tn-colors.setup)
(def- colors ((. (require :tokyonight.colors) :setup)))

(defn- mode-hl [] {:name (mode-utils.get_mode_highlight_name)
                      :fg colors.bg_statusline
                      :bg (mode-utils.get_mode_color)
                      :style :bold})

(defn- mode-hl-rev [] {:name (mode-utils.get_mode_highlight_name)
                       :fg (mode-utils.get_mode_color)
                       :bg colors.bg_highlight})

(def- left [{:provider :vi_mode
             :short_provider " "
             :icon ""
             :hl mode-hl
             :left_sep :left_rounded
             :right_sep {:str " "
                         :hl mode-hl}}

            {:provider :file_info
             :type :short-path
             :file_readonly_icon " "
             :hl {:bg colors.bg_highlight}
             :left_sep {:str " "
                        :hl {:bg colors.bg_highlight}}
             :right_sep [{:str " "
                          :hl {:bg colors.bg_highlight}}
                         {:str :right_rounded
                          :hl {:fg colors.bg_highlight :bg colors.bg_statusline}}]}

            {:provider :git_branch
             :truncate_hide true
             :priority 2
             :icon :
             :hl {:fg colors.fg_dark}
             :left_sep " "
             :right_sep " "}

            {:provider :git_diff_added
             :truncate_hide true
             :icon "+"
             :hl {:fg colors.green}}

            {:provider :git_diff_changed
             :truncate_hide true
             :icon "~"
             :hl {:fg colors.blue}}

            {:provider :git_diff_removed
             :truncate_hide true
             :icon "-"
             :hl {:fg colors.red}}
            ])

(def- right [{:provider :diagnostic_errors
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.red}
              :right_sep " "}

             {:provider :diagnostic_warnings
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.red}
              :right_sep " "}

             {:provider :diagnostic_hints
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.red}
              :right_sep " "}

             {:provider :diagnostic_info
              :truncate_hide true
              :priority 1
              :icon " "
              :hl {:fg colors.red}
              :right_sep " "}

             {:provider :lsp_client_names
              :truncate_hide true
              :priority 1
              :hl {:fg colors.dark5}
              :right_sep " "}

             {:provider (fn [] (vim.api.nvim_buf_get_option 0 :filetype))
              :hl mode-hl-rev
              :left_sep [:left_rounded
                         {:str " "
                          :hl {:bg colors.bg_highlight}}]}

             {:provider (fn [] (let [(row) (unpack (vim.api.nvim_win_get_cursor 0))]
                                           (string.format "%3d" row)))
              :hl {:bg colors.bg_highlight}
              :left_sep {:str " "
                         :hl {:bg colors.bg_highlight}}}

             {:provider ::
              :hl {:fg colors.fg_dark :bg colors.bg_highlight}}

             {:provider (fn [] (let [(_ col) (unpack (vim.api.nvim_win_get_cursor 0))]
                                           (string.format "%-3d" (+ col 1))))
              :hl {:bg colors.bg_highlight}}

             {:provider :line_percentage
              :hl mode-hl-rev 
              :right_sep {:str " "
                          :hl {:bg colors.bg_highlight}}
              :right_sep [{:str " "
                           :hl {:bg colors.bg_highlight}}
                          {:str :right_rounded
                           :hl {:fg colors.bg_highlight :bg colors.bg_statusline}}]}])

(def- active [left right])

(def- inactive [[{:provider :file_info
                  :hl {:fg colors.bg_comment}}]])

(def- components {:active active :inactive inactive})

(def- mode-colors {:NORMAL    colors.blue
                   :OP        colors.blue
                   :INSERT    colors.teal
                   :VISUAL    colors.orange
                   :LINES     colors.orange
                   :BLOCK     colors.orange
                   :REPLACE   colors.red
                   :V-REPLACE colors.red
                   :ENTER     colors.yellow
                   :MORE      colors.yellow
                   :SELECT    colors.yellow
                   :COMMAND   colors.blue2
                   :SHELL     colors.yellow
                   :TERM      colors.yellow
                   :NONE      colors.fg_gutter})

(feline.setup {:components components
               :vi_mode_colors mode-colors
               :theme {:fg colors.fg
                       :bg colors.bg_statusline}})
