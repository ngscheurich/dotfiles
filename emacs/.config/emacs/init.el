;;; init.el --- The Emacs Initialization File  -*- lexical-binding: t -*-

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

;; This file is loaded when Emacs is started, and is the conventional
;; place for one to configure their Emacs system.
;;
;; As I use the aptly-named literate configuration style to document
;; and produce configuration code, this particular initialization
;; file’s job is quite singular: to load my Org-based configuration
;; and tangle the code blocks in order to generate Emacs Lisp code.
;;
;; For more information about the Emac Initialization File, see
;; <https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html>.

;;; Code:

(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))

;;; init.el ends here
