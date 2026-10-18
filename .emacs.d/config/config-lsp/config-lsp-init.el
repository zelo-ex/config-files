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
(setq-default electric-indent-inhibit t)

(require 'yasnippet)
(yas-global-mode 1)

;; lsp-mode 连上后会执行 lsp-completion-mode，并在其中用
;; (cl-adjoin 'company-capf company-backends) 把孤立的 company-capf
;; 插到 company-backends 最前面，导致 company 只采用这个孤立后端、
;; 跳过 (company-capf company-yasnippet) 组合组，snippet 补全因此失效。
;; 这里在 lsp-completion-mode 之后把 company-backends 恢复成组合形式。
(defun my-lsp-restore-company-backends ()
  (when lsp-completion-mode
    (cond ((memq major-mode '(c-ts-mode c++-ts-mode go-ts-mode java-mode))
           (setq-local company-backends
                       '((company-capf company-yasnippet)
                         company-files
                         company-dabbrev-code)))
          ((eq major-mode 'python-ts-mode)
           (setq-local company-backends
                       '((company-capf company-yasnippet)))))))

(with-eval-after-load 'lsp-completion
  (add-hook 'lsp-completion-mode-hook #'my-lsp-restore-company-backends))

(load (expand-file-name "config-lsp-go.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-cc.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-web.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-python.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-racket.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-java.el" (file-name-directory load-file-name)))
(load (expand-file-name "config-lsp-rn.el" (file-name-directory load-file-name)))

(provide 'config-lsp-init)
