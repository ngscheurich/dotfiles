;;; ngs-minibuf.el --- Minibuffer enhancements -*- lexical-binding: t; -*-

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
;; This program is distributed in the hope that it wnnill be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Minibuffer enhancements for my Emacs configuration.

;;; Code:

;; =====================================================================
;; Embark
;; ---------------------------------------------------------------------
;; Emacs Mini-Buffer Actions Rooted in Keymaps 
;; https://github.com/oantolin/embark
;; ---------------------------------------------------------------------
(use-package embark
  :ensure t
  :bind  (("C-." . embark-act)
          ("C-;" . embark-dwim)
          ("C-h B" . embark-bindings))
  :init
  ;; Replace the help buffer with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; =====================================================================
;; embark-consult
;; ---------------------------------------------------------------------
;; Consult integration for Embark 
;; https://github.com/oantolin/embark
;; ---------------------------------------------------------------------
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'ngs-minibuf)
;;; ngs-minibuf.el ends here
