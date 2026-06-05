(let* ((root (file-name-directory load-file-name)))

  (add-to-list 'load-path (expand-file-name "config-lsp" root))
  (require 'config-lsp-init)
  (add-to-list 'load-path (expand-file-name "config-utils" root))
  (require 'config-utils-themes))

(provide 'config-entry)
