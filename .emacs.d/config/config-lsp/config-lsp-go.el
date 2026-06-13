;;; -*- lexical-binding: t -*-

(require 'lsp-go)

(defun custom-go-ts-mode-hook ()
  (setq-local indent-tabs-mode t)
  (add-hook 'before-save-hook #'lsp-format-buffer nil t))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (go-ts-mode . lsp-deferred)
  (go-ts-mode . custom-go-ts-mode-hook)
  :mode ("\\.go\\'" . go-ts-mode)
  :init
  (setq lsp-completion-provider :capf)
  (setq lsp-completion-enable t))

(provide 'config-lsp-go)
