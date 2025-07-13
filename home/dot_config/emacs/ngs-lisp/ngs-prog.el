;;; ngs-prog.el --- Programming setup -*- lexical-binding: t; -*-

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

;; Programming setup for my Emacs configuration.

;;; Code:

;; Tree-sitter grammars
(setq treesit-language-source-alist
      '((elixir "https://github.com/elixir-lang/tree-sitter-elixir")
	(heex "https://github.com/phoenixframework/tree-sitter-heex")))

;; Tab settings
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Display numbers in programming buffers
(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode))

;; Language Server Protocol (LSP) client
;; https://joaotav
;; ora.github.io/eglot/
(use-package eglot
  :bind
  (("C-c l f" . 'eglot-format-buffer)
   ("C-c l a" . 'eglot-code-actions)
   ("C-c l r" . 'eglot-rename)))

;; Show documentation in the minibuffer
;; https://elpa.gnu.org/packages/eldoc.html
(use-package eldoc
  :init
  (setq eldoc-echo-area-use-multiline-p nil))

;; Display eldoc info in a childframe
;; https://github.com/casouri/eldoc-box
(use-package eldoc-box
  :ensure t
  :bind ("C-c d" . 'eldoc-box-help-at-point))

;; Elixir
(use-package elixir-ts-mode
  :ensure t
  :after eglot
  :init
  (add-to-list 'eglot-server-programs
	       `((elixir-ts-mode heex-ts-mode) . ("/Users/nick/Projects/lexical/_build/dev/package/lexical/bin/start_lexical.sh")))
  (add-hook 'elixir-ts-mode-hook 'eglot-ensure)
  (add-hook 'heex-ts-mode-hook 'eglot-ensure)
  :mode
  (("\\.ex\\'" . elixir-ts-mode)
   ("\\.exs\\'" . elixir-ts-mode)))

;; =====================================================================
;; nix-mode
;; ---------------------------------------------------------------------
;; An Emacs major mode for editing Nix expressions 
;; https://github.com/NixOS/nix-mode
;; ---------------------------------------------------------------------
(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")


(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

(provide 'ngs-prog)
;;; ngs-prog.el ends here
