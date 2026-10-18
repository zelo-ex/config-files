;;; -*- lexical-binding: t -*-

(use-package lsp-mode
  :hook ((typescript-ts-mode . lsp)
         (tsx-ts-mode . lsp)
         (js-mode . lsp)
         (js-ts-mode . lsp))
  :config
  (setq lsp-eslint-enable t
        lsp-eslint-auto-fix-on-save t
	lsp-clients-typescript-prefer-use-project-ts-server t))

(provide 'config-lsp-rn)
