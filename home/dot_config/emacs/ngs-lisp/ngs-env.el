;;; ngs-env.el --- Environment customizations  -*- lexical-binding: t; -*-

;; Copyright (C) 2025 N. G. Scheurich

;; Author: N. G. Scheurich <nick@scheurich.haus>
;; URL: https://scheurich.haus/emacs
;; Package-Requires: ((emacs "30.1"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Environment customizations for my Emacs configuration.

;;; Code:

;; Needed until https://github.com/d12frosted/homebrew-emacs-plus/issues/720
  ;; is resolved.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Add Nix bin directories to `exec-path'
(add-to-list 'exec-path
	     (format "/etc/profiles/per-user/%s/bin/" (getenv "USER")))
(add-to-list 'exec-path "/run/current-system/sw/bin/")

(defun ngs-home-manager-bin (file)
  "Returns the path to the Home Manager bin `file' for the current user."
  (format "/etc/profiles/per-user/%s/bin/%s" (getenv "USER") file))

;; =====================================================================
;; envrc.el
;; ---------------------------------------------------------------------
;; Buffer-local direnv integration 
;; https://github.com/purcell/envrc
;; ---------------------------------------------------------------------
(use-package envrc
  :ensure t
  :bind
  (:map envrc-mode-map ("C-c e" . envrc-command-map))
  :config
  (envrc-global-mode))

(use-package envrc
   :ensure t
   :config
   (define-key envrc-mode-map (kbd "C-c e") 'envrc-command-map)
   (envrc-global-mode))
 

(provide 'ngs-env)
;;; ngs-env.el ends here
