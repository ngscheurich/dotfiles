;;; init.el --- My Emacs init  -*- lexical-binding: t; -*-

;;; Commentary:

;; Initialization file for my GNU Emacs setup.
;; See (info "(emacs) Init File")

;;; Code:

;; Keep config directory tidy
(defvar ngs-var-dir
  (locate-user-emacs-file "var/")
  "Directory in which to store variable data files")

(defvar ngs-auto-save-list-dir
  (expand-file-name "auto-save-list/" ngs-var-dir)
  "Directory in which to store auto-save-list files")
  
(defvar ngs-auto-save-dir
  (expand-file-name "auto-save/" ngs-var-dir)
  "Directory in which to store auto-save files")

(defvar ngs-backup-dir
  (expand-file-name "backup/" ngs-var-dir)
  "Directory in which to store backup files")

(mapcar (lambda (dir)
          (unless (file-directory-p dir)
            (make-directory dir)))
        `(,ngs-var-dir
          ,ngs-auto-save-list-dir
          ,ngs-auto-save-dir
          ,ngs-backup-dir))

(setopt auto-save-file-name-transforms `((".*" ,ngs-auto-save-dir t))
        backup-directory-alist `((".*" . ,ngs-backup-dir))
	custom-file (expand-file-name "custom.el" ngs-var-dir))

;; Don’t load startup screen
(setopt inhibit-startup-screen t)

;; Resize pixelwise rather than charwise
(setopt frame-resize-pixelwise t
        window-resize-pixelwise t)

;; Silence the bell
(setopt ring-bell-function 'ignore)

;; Remove unnecessary app chrome
(setopt tool-bar-mode nil)
(setopt scroll-bar-mode nil)
(unless (eq system-type 'darwin)
  (setopt menu-bar-mode nil))

;; Swap default meta and super keys on macOS
(if (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'super))

;; Display line numbers
(setopt global-display-line-numbers-mode t)

;; Display the column offset in the mode line
(setopt column-number-mode t)

;; Enable tab-bar
(setopt tab-bar-mode t)

;; Introduce myself
(setopt user-full-name "Nicholas Scheurich"
        user-email-address "nick@scheurich.me")

;; Move back and forth through window configurations in a tab
(keymap-global-set "M-[" 'tab-bar-history-back)
(keymap-global-set "M-]" 'tab-bar-history-forward)

;; Use `M-x ibuffer` rather than the standard buffer list
(global-set-key [remap list-buffers] 'ibuffer)

;; Move to other window with `M-o`
(keymap-global-set "M-o" 'other-window)

;; End sentences with a single space
(setopt sentence-end-double-space nil)

;; Initialize package manager
(require 'package)
(setq package-install-upgrade-built-in t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Load package configurations
(load "~/.config/emacs/pack")
;;; init.el ends here
