;;; -*- lexical-binding: t -*-

(defun custom-python-ts-mode-hook ()
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local python-indent-offset 4)
  (setq-local python-indent-guess-indent-offset nil)
  (setq-local company-backends '((company-capf company-yasnippet)))
  (local-set-key (kbd "TAB") 'indent-for-tab-command))

(use-package lsp-mode
  :commands (lsp lsp-defered)
  :hook
  (python-ts-mode . lsp-deferred)
  (python-ts-mode . custom-python-ts-mode-hook)
  :mode ("\\.py\\'" . python-ts-mode)
  :init
  (setq lsp-pylsp-plugins-flake8-enabled t)
  (setq lsp-pylsp-plugins-flake8-ignore '("D100" "D103"))
  (setq lsp-pylsp-plugins-flake8-max-line-length 80))

(provide 'config-lsp-python)
