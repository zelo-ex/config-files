;;; -*- lexical-binding: t -*-

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-capf
  :ensure t
  :after yasnippet
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l"
        read-process-output-max (* 1024 1024))
  :custom
  (lsp-completion-provider :capf)
  (lsp-enable-snippet t)
  (lsp-headerline-breadcrumb-enable t)
  (lsp-modeline-code-actions-enable nil)
  (lsp-enable-indentation nil)
  (lsp-enable-text-edit-mode nil)
  :config
  (lsp-enable-which-key-integration t)
  (lsp-register-custom-settings
   '(("html.autoClosingTags" t t)
     ("html.completion.attributeDefaultValue" "doublequotes" t))))

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.vue\\'"   . web-mode)
         ("\\.jsx?\\'"  . web-mode)
         ("\\.tsx?\\'"  . web-mode))
  :custom
  (web-mode-markup-indent-offset 4)
  (web-mode-css-indent-offset 4)
  (web-mode-code-indent-offset 4)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-css-colorization t)
  :hook
  (web-mode . lsp-deferred)
  (web-mode . (lambda ()
                (setq-local company-backends '(company-capf)))))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1)
  (company-tooltip-align-annotations t)
  :bind (:map company-active-map
         ("RET" . company-complete-selection)
         ("<return>" . company-complete-selection)
         ("TAB" . company-complete-common-or-cycle)
         ("<tab>" . company-complete-common-or-cycle)))

(use-package emmet-mode
  :ensure t
  :hook (web-mode . emmet-mode)
  :custom
  (emmet-move-cursor-between-quotes t)
  :bind (:map emmet-mode-keymap
         ("C-j" . emmet-expand-line)))

(provide 'config-lsp-web)
