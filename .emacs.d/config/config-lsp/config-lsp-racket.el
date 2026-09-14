;;; -*- lexical-binding: t -*-

(require 'racket-mode)
(setq auto-mode-alist (cons '("\\.rkt\\'" . racket-mode) auto-mode-alist))
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(add-hook 'racket-mode-hook
         (lambda ()
           (define-key racket-mode-map (kbd "C-x C-j") 'racket-run)))
(setq tab-always-indent 'complete)

(provide 'config-lsp-racket)
