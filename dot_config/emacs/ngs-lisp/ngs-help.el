;;; ngs-help.el --- Discoverability affordances  -*- lexical-binding: t; -*-

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

;; Discoverability affordances for my Emacs configuration.

;;; Code:

;; =====================================================================
;; Helpful
;; ---------------------------------------------------------------------
;; A better Emacs *help* buffer 
;; https://github.com/Wilfred/helpful
;; ---------------------------------------------------------------------
(use-package helpful
  :ensure 
  :bind
  (("C-h h" . 'helpful-at-point)
   ("C-h f" . 'helpful-callable)
   ("C-h c" . 'helpful-command)
   ("C-h k" . 'helpful-key)
   ("C-h v" . 'helpful-variable)))

;; =====================================================================
;; which-key
;; ---------------------------------------------------------------------
;; Displays available keybindings in popup 
;; https://github.com/justbur/emacs-which-key
;; ---------------------------------------------------------------------
(use-package which-key
  :ensure t
  :config (which-key-mode))

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

(provide 'ngs-help)
;;; ngs-help.el ends here
