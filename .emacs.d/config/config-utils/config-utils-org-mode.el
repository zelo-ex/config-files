;;; -*- lexical-binding: t -*-

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-latex-compiler "xelatex")

(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(setq org-preview-latex-default-process 'dvisvgm)
(add-to-list 'org-latex-packages-alist '("" "ctex" t))

(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)
(setq org-cycle-include-plain-lists 'integrate)
(setq org-startup-folded 'content)

(add-hook 'org-mode-hook #'turn-on-font-lock)
(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star 'nil)
  (setq org-modern-todo t)
  (setq org-modern-table t))

(provide 'config-utils-org-mode)
