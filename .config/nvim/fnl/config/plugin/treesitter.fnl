(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed ["c"
                      "c_sharp"
                      "css"
                      "dockerfile"
                      "elixir"
                      "erlang"
                      "gdscript"
                      "graphql"
                      "javascript"
                      "lua"
                      "nix"
                      "python"
                      "regex"
                      "ruby"
                      "toml"
                      "typescript"
                      "yaml"]
   :highlight {:enable true :disable ["elixir"]}
   :incremental_selection {:enable true :disable []}
   :indent {:enable true :disable []}})
