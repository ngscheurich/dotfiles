;;; ngs-navigate.el --- Navigation helpers  -*- lexical-binding: t; -*-

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

;; Navigation helpers for my Emacs configuration.

;;; Code:

;; =====================================================================
;; avy
;; ---------------------------------------------------------------------
;; Jump to things in Emacs tree-style 
;; https://github.com/abo-abo/avy
;; ---------------------------------------------------------------------
(use-package avy
  :ensure t
  :bind ("M-j" . avy-goto-char-timer))

(provide 'ngs-navigate)
;;; ngs-navigate.el ends here
