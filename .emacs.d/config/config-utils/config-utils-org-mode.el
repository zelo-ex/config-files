;;; -*- lexical-binding: t -*-

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-hook 'org-mode-hook #'turn-on-font-lock)

(provide 'config-utils-org-mode)
