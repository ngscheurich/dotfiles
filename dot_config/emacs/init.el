;;; GNU Emacs initialization

(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 50 1024 1024))))

(add-to-list 'load-path (locate-user-emacs-file "ngs-lisp"))
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

(require 'ngs-core)

(require 'ngs-buffers)
(require 'ngs-complete)
(require 'ngs-edit)
(require 'ngs-env)
(require 'ngs-git)
(require 'ngs-help)
(require 'ngs-minibuf)
(require 'ngs-meow)
(require 'ngs-navigate)
(require 'ngs-notes)
(require 'ngs-prog)
(require 'ngs-shell)
(require 'ngs-snippets)
(require 'ngs-theme)

; (require 'wgrep)

;; Scratchpad
; (bind-key "C-x M-f" 'find-file-other-window)
; (bind-key "C-x M-b" 'switch-to-buffer-other-window)

; (defun ngs-duplicate-line ()
;   (interactive)
;   (move-beginning-of-line nil)
;   (kill-line)
;   (yank)
;   (open-line 1)
;   (next-line 1)
;   (yank)
;   (back-to-indentation))
;
; (use-package beframe
;   :ensure t
;   :init
;   ;; This is the default
;   (setopt beframe-global-buffers '("*scratch*" "*Messages*" "*Backtrace*"))
;   :config
;   (beframe-mode 1)
;   (define-key global-map (kbd "C-c b") #'beframe-prefix-map))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
