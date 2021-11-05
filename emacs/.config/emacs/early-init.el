;;; early.init.el --- The Early Init File  -*- lexical-binding: t -*-

;; Author: N. G Scheurich <nick@scheurich.haus>
;; URL: https://github.com/ngscheurich/dotfiles
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.2"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This file is loaded before the package system and GUI is
;; initialized and, as such, can affect that initialization process.
;;
;; I use this file in particular for setting up my package management
;; system and disabling some GUI elements that are not relevant to the
;; way in which I use Emacs.
;; 
;; Emacs has a built-in packager, package.el, but I prefer to use the
;; straight.el package manager for a few key reasons:
;;
;; * It affords the ability to use a specific Git revision of a package
;; * It only loads the packages present in my configuration
;; * It supports true portabilty/reproducibility via lockfiles
;; * It allows me to make ad-hoc changes to packages
;;
;; There are numerous other advantages, and some disadvantages, when
;; compared to package.el which are enumerated in straight.el’s README:
;; <https://github.com/raxod502/straight.el#comparison-to-packageel>
;;
;;
;; For more information about the Early Init file, see
;; <https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html>.

;;; Code:

;; Prevent package.el from loading any packages
(setq package-enable-at-startup nil)

;; Bootstrap straight.el, i.e. download and install and evaluate it if
;; it is not detected. See <https://github.com/raxod502/straight.el#getting-started>.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Disable GUI elements
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; early-init.el ends here
