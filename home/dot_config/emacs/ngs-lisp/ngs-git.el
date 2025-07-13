;;; ngs-git.el --- Git VCS helpers  -*- lexical-binding: t; -*-

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

;; Git workflows support for my Emacs configuration.

;;; Code:

;; =====================================================================
;; Magit
;; ---------------------------------------------------------------------
;; A Git Porcelain inside Emacs 
;; https://magit.vc/
;; ---------------------------------------------------------------------
(use-package magit
  :ensure t)

;; =====================================================================
;; diff-hl
;; ---------------------------------------------------------------------
;; Highlights uncommitted changes 
;; https://github.com/dgutov/diff-hl
;; ---------------------------------------------------------------------
(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(provide 'ngs-git)
;;; ngs-git.el ends here
