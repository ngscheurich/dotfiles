(setq user-full-name "Nicholas Scheurich"
      user-mail-address "nick@scheurich.haus")

(setq inhibit-startup-message t)

(setq visible-bell t)

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(global-display-line-numbers-mode 1)
;; (menu-bar--display-line-numbers-mode-relative 1)

;; Do I need to set the default face if I set both fixed- and variable-pitch
(set-face-attribute 'default nil :font "PragmataPro Mono Liga" :height 140)
(set-face-attribute 'fixed-pitch nil :font "PragmataPro Mono Liga" :height 140)
(set-face-attribute 'variable-pitch nil :font "IBM Plex Sans" :height 140)

(setq-default line-spacing 0.1)

(mac-auto-operator-composition-mode t)

(use-package modus-themes
  :init
  (setq modus-themes-mode-line '(padded borderless))
  (modus-themes-load-themes)
  :config
  (modus-themes-load-vivendi)
  :bind
  ("<f5>" . modus-themes-toggle))

(setq column-number-mode t)

(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

;; TODO: Explore consult configuration options.
;; https://github.com/minad/consult#use-package-example would be a good starting point.
(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("M-s l" . consult-line)))

(use-package orderless
  :init
  (setq completion-styles '(orderless)))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package elixir-mode)





(require 'org-faces)
(dolist (face '((org-level-1 . 1.25)
                (org-level-2 . 1.2)
                (org-level-3 . 1.15)
                (org-level-4 . 1.1)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "IBM Plex Sans" :weight 'semibold :height (cdr face)))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(defun ngs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . ngs/org-mode-visual-fill))

(set-face-attribute 'org-block nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(defun ngs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (display-line-numbers-mode 0))

(use-package org
  :hook (org-mode . ngs/org-mode-setup)
  :config
  (setq org-hide-emphasis-markers t)
  (setq org-directory (expand-file-name "~/Dropbox/Org"))
      (setq org-agenda-files '("tasks.org")))

;; Hide minor modes in the mode line
;; (use-package diminish)

;; Show potential keybindings
(use-package which-key
  :config
  (which-key-mode))

;; Richer help buffers
(use-package helpful
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))

;; Get Emacs path from shell $PATH
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Project management
(use-package projectile
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-switch-project-action #'projectile-dired)
  (projectile-project-search-path . '((expand-file-name "~/Projects"))))

;; Language Server client
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((elixir-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

;; In-buffer completion
(use-package company
  :delight
  :after
  lsp-mode
  :hook
  (prog-mode . company-mode))

(use-package company-box
  :delight
  :hook (company-mode . company-box-mode))

;; Make <escape> quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; general.el
(use-package general
  :after evil
  :config
  (general-create-definer ngs/leader-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (ngs/leader-def
    ;; Open my config.org
    "fc" '(lambda () (interactive)
            (find-file (expand-file-name "config.org" user-emacs-directory)))))

(use-package treemacs)
;; (use-package treemacs-evil)
;; (use-package treemacs-projectile)

(use-package hydra)

;; Emacs Mini-Buffer Actions Rooted in Keymaps
(use-package embark
  :bind
  (("C-." . embark-act)))

(use-package flycheck
  :init (global-flycheck-mode))
