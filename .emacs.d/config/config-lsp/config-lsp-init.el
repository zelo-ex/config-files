;;; -*- lexical-binding: t -*-

(use-package lsp-mode)

(use-package company
  :config
  (setq
   company-idle-delay 0
   company-minimum-prefix-length 1
   company-tooltip-limit 20
   company-show-quick-access t
   company-tooltip-offset-display 'scrollbar
   company-echo-delay 0
   company-require-match nil
   company-begin-commands '(self-insert-command)
   company-backends '((company-capf
		       company-yasnippet)
                       company-files
                       company-dabbrev-code))
  :hook (after-init . global-company-mode))

(electric-pair-mode t)

(load (expand-file-name "config-lsp-go.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-cc.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-web.el" (file-name-directory load-file-name)))

(provide 'config-lsp-init)
