;; GNU Emacs early initialization

(setq gc-cons-threshold most-positive-fixnum)

(setopt frame-resize-pixelwise t
        window-resize-pixelwise t
        ring-bell-function 'ignore
        use-short-answers t
        inhibit-splash-screen t
        inhibit-startup-screen t)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(unless (eq system-type 'darwin)
  (menu-bar-mode -1))

(if (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-right-command-modifier 'super)
    (setq mac-option-modifier 'alt)
    (setq mac-right-option-modifier 'hyper))

(setq package-enable-at-startup t)
