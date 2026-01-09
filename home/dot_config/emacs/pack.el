;;; pack.el --- Package configs  -*- lexical-binding: t; -*-

;;; Commentary:

;; Declarative package configurations for my GNU Emacs setup.

;;; Code:

;; Keep track of opened files
(use-package recentf
   :init
   (setopt recentf-save-file (expand-file-name "recentf" ngs-var-dir))
   :config (recentf-mode t))

;; Save minibuffer history
(use-package savehist
  :init
  (setopt savehist-file (expand-file-name "history" ngs-var-dir)
          history-length 40)
  :config (savehist-mode))

;; Display available keybindings in popup 
(use-package which-key
  :config (which-key-mode))

;; Use the Modus themes
(use-package emacs
  :init
  (require-theme 'modus-themes)
  :config
  (setopt modus-themes-to-toggle '(modus-operandi-tinted modus-vivendi-tinted))
  (modus-themes-load-theme 'modus-operandi-tinted)
  (keymap-global-set "<f5>" #'modus-themes-toggle))

;; =====================================================================
;; Fontaine
;; ---------------------------------------------------------------------
;; Set Emacs font configurations using presets
;; https://protesilaos.com/emacs/fontaine
;; ---------------------------------------------------------------------
(use-package fontaine
  :ensure t
  :init
  (setopt fontaine-latest-state-file
	  (expand-file-name "fontaine-latest-state.eld" ngs-var-dir)
	  fontaine-presets
	  '((regular)
	    (t
	     :default-family "Berkeley Mono"
             :default-weight regular
             :default-height 120
	     :line-spacing 0.2)))
  :config
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (fontaine-mode 1)
  :bind
  (("C-c f" . fontaine-set-preset)))


;; =====================================================================
;; Helpful
;; ---------------------------------------------------------------------
;; A better Emacs *help* buffer 
;; https://github.com/Wilfred/helpful
;; ---------------------------------------------------------------------
(use-package helpful
  :ensure t
  :bind
  (("C-h h" . helpful-at-point)
   ("C-h f" . helpful-callable)
   ("C-h c" . helpful-command)
   ("C-h k" . helpful-key)
   ("C-h v" . helpful-variable)))

;; =====================================================================
;; Casual
;; ---------------------------------------------------------------------
;; Transient-based interfaces for built-in Emacs modes 
;; https://github.com/kickingvegas/casual
;; ---------------------------------------------------------------------
(use-package casual
  :ensure t
  :bind
  (:map dired-mode-map
   ("C-o" . casual-dired-tmenu)
   :map ibuffer-mode-map
   ("C-o" . casual-ibuffer-tmenu)
   :map isearch-mode-map
   ("C-o" . casual-isearch-tmenu)
   :map Info-mode-map
   ("C-o" . casual-info-tmenu)))


;; =====================================================================
;; Vertico
;; ---------------------------------------------------------------------
;; VERTical Interactive COmpletion
;; https://github.com/minad/vertico
;; ---------------------------------------------------------------------
(use-package vertico
  :ensure t
  :config (vertico-mode))

;; =====================================================================
;; Marginalia
;; ---------------------------------------------------------------------
;; Rich annotations for minibuffer completion
;; https://github.com/minad/marginalia
;; ---------------------------------------------------------------------
(use-package marginalia
  :ensure t
  :config (marginalia-mode))

;; =====================================================================
;; Consult
;; ---------------------------------------------------------------------
;; Enhanced completing-read interfaces
;; https://github.com/minad/consult
;; ---------------------------------------------------------------------
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
	 ("C-x 4 b" . consult-buffer-other-window)))

;; =====================================================================
;; Corfu
;; ---------------------------------------------------------------------
;; COmpletion in Region FUnction
;; https://github.com/minad/corfu
;; ---------------------------------------------------------------------
(use-package corfu
  :ensure t
  :init 
  (setopt corfu-auto t) 
  (global-corfu-mode))

;; ;; =====================================================================
;; ;; Cape
;; ;; ---------------------------------------------------------------------
;; ;; Completion At Point Extensions
;; ;; https://github.com/minad/cape
;; ;; ---------------------------------------------------------------------
;; (use-package cape
;;   :ensure t
;;   :config
;;   (add-to-list 'completion-at-point-functions #'cape-file))

;; =====================================================================
;; Orderless
;; ---------------------------------------------------------------------
;; Completion style that matches multiple regexps in any order
;; https://github.com/oantolin/orderless
;; ---------------------------------------------------------------------
(use-package orderless
  :ensure t
  :config
  (setopt completion-styles '(orderless)))

;;  =====================================================================
;;; YASnippet
;;  ---------------------------------------------------------------------
;;  A template system for Emacs 
;;  https://github.com/joaotavora/yasnippet
;;  ---------------------------------------------------------------------
(use-package yasnippet
  :config (yas-global-mode 1))
;;; pack.el ends here
