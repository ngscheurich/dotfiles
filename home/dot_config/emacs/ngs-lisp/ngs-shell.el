;;; ngs-shell.el --- Shells setup  -*- lexical-binding: t; -*-

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

;; Shells setup for my Emacs configuration.

;;; Code:

(use-package emacs
  :init
  (setopt shell-file-name (ngs-home-manager-bin "bash")
 	        sh-shell (ngs-home-manager-bin "bash")
	        sh-shell-file (ngs-home-manager-bin "bash")))

;; =====================================================================
;; Eat
;; ---------------------------------------------------------------------
;; Emulate A Terminal, in a region, in a buffer and in Eshell 
;; https://codeberg.org/akib/emacs-eat
;; ---------------------------------------------------------------------
(use-package eat
  :ensure t)

(provide 'ngs-shell)
;;; ngs-shell.el ends here
