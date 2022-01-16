(module config.core.signs)

(let [signs {:LspDiagnosticsSignError       {:text ""}
             :LspDiagnosticsSignWarning     {:text ""}
             :LspDiagnosticsSignInformation {:text ""}
             :LspDiagnosticsSignHint        {:text ""}}]
  (each [k v (pairs signs)]
    (vim.fn.sign_define k v)))
