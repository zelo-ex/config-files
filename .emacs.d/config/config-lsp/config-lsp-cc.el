;;; -*- lexical-binding: t -*-

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . c-ts-mode))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(c-ts-mode . "c"))
  (add-to-list 'lsp-language-id-configuration '(c++-ts-mode . "cpp")))

(defun my-c-ts-mode-setup ()
  (setq-local c-ts-mode-indent-style 'linux)
  (setq-local tab-width 8)
  (setq-local c-ts-mode-indent-offset 8)
  (lsp-deferred))
(add-hook 'c-ts-mode-hook #'my-c-ts-mode-setup)

(defun my-c++-ts-mode-setup ()
  (setq-local c++-ts-mode-indent-style 'linux)
  (setq-local tab-width 8)
  (setq-local c++-ts-mode-indent-offset 8)
  (lsp-deferred))
(add-hook 'c++-ts-mode-hook #'my-c++-ts-mode-setup)

(with-eval-after-load 'lsp-mode
  (setq lsp-enable-on-type-formatting nil))

(provide 'config-lsp-cc)
