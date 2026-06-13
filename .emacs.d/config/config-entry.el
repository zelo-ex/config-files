(let* ((root (file-name-directory load-file-name)))

  (add-to-list 'load-path (expand-file-name "config-utils" root))
  (require 'config-utils-themes)
  (require 'config-utils-org-mode)
  (add-to-list 'load-path (expand-file-name "config-lsp" root))
  (require 'config-lsp-init))

(provide 'config-entry)
