;;; -*- lexical-binding: t -*-

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)

(add-hook 'org-mode-hook #'turn-on-font-lock)

(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star 'nil)
  (setq org-modern-todo t)
  (setq org-modern-table t))

(provide 'config-utils-org-mode)
