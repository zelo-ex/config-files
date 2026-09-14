;; -*- lexical-binding: t -*-

(use-package lsp-mode
  :ensure t
  :mode ("\\.java\\'" . java-mode)
  :hook (java-mode . lsp-deferred)
  :init
  (setq lsp-completion-provider :capf)
  :config
  (setq lsp-enable-snippet nil)
  (setq lsp-log-io nil)
  
  (lsp-register-client
   (make-lsp-client :new-connection
                    (lsp-stdio-connection '("jj-language-server" "--stdio"
					    "--log-level" "4"))
                    :major-modes '(java-mode)
                    :server-id 'jj-language-server)))

(provide 'config-lsp-java)
