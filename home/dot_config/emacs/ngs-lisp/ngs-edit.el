;;; ngs-edit.el --- Text editing helpers  -*- lexical-binding: t; -*-

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

;; Text editing helpers for my Emacs configuration.

;;; Code:

;; =====================================================================
;; Iedit
;; ---------------------------------------------------------------------
;; Modify multiple occurences simultaneously 
;; https://github.com/victorhge/iedit
;; ---------------------------------------------------------------------
(use-package iedit
  :ensure t
  :bind ("C-c C-;" . iedit-mode))

;; =====================================================================
;; multiple-cursors.el 
;; ---------------------------------------------------------------------
;; Mutiple cursors for Emacs
;; https://github.com/magnars/multiple-cursors.el
;; ---------------------------------------------------------------------
(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C->" . mc/mark-all-like-this)))

(provide 'ngs-edit)
;;; ngs-edit.el ends here
