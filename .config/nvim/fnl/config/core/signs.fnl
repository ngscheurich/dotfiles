(module config.core.signs)

(let [signs {:DiagnosticSignError       {:text "" :texthl :DiagnosticSignError}
             :DiagnosticSignWarn        {:text "" :texthl :DiagnosticSignWarn}
             :DiagnosticSignInformation {:text "" :texthl :DiagnosticSignInformation}
             :DiagnosticSignHint        {:text "" :texthl :DiagnosticSignHint}}]
  (each [k v (pairs signs)]
    (vim.fn.sign_define k v)))
