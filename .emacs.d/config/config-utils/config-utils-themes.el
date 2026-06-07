;;; -*- lexical-binding: t -*-

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(setq-default inhibit-splash-screen t)

(require 'use-package)
(setq use-package-always-defer nil
      use-package-always-demand t)

(use-package emacs
  :config
  (add-to-list 'default-frame-alist '(fullscreen . fullboth))
  (defalias 'yes-or-no-p 'y-or-n-p)
  (dolist (mode '(text-mode-hook prog-mode-hook conf-mode-hook))
    (add-hook mode (
		    lambda() (progn
			       (display-line-numbers-mode 1)
			       (custom-set-variables '(display-line-numbers-type (quote relative)))
			       )))))

;;; TODO: change background color
(defun custom-doom-theme-fix-background-hook ()
  (setq foo (car-safe doom-themes--colors))
  (setq bg-color (cons (car foo) (cons "#1e1e1e" (nthcdr 2 foo))))
  (setq doom-themes--colors (cons bg-color (nthcdr 1 doom-themes--colors))))

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

 (use-package doom-modeline
   :hook (after-init . doom-modeline-mode)
   :config
   (setq doom-modeline-height 25))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'config-utils-themes)
