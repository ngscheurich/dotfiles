(module config.plugin.formatter
  {autoload {formatter formatter}})

(defn- prettier []
  (let [filepath (vim.fn.fnameescape (vim.api.nvim_buf_get_name 0))]
    {:exe :npx
     :args ["prettier" "--stdin-filepath" filepath]}))

(formatter.setup
  {:filetype {:css [prettier]
              :html [prettier]
              :javascript [prettier]
              :typescript [prettier]}})
