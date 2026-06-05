;;; -*- lexical-binding: t -*-
(package-initialize)
(setq make-backup-files nil)

(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose nil)

(let ((config-root
       (file-name-directory load-file-name)))
  (setq custom-file (expand-file-name "custom.el" config-root))
  (load custom-file 'no-error 'no-message)
  (require 'kbd)
  (add-to-list 'load-path (expand-file-name "config" config-root))
  (require 'config-entry))

(provide 'entry)
