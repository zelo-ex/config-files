;;; -*- lexical-binding: t -*-
(setq-default inhibit-splash-screen t)
(setq make-backup-files nil)

(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(unless (require 'use-package nil t)
  (progn
    (package-refresh-contents)
    (let ((native-comp-deferred-compilation t)
          (native-comp-jit-compilation nil))
      (package-install 'use-package))
    (require 'use-package)))
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose nil)

(use-package org :load-path "~/.emacs.d/org-mode/lisp/")

(let ((config-root
       (file-name-directory load-file-name)))
  (setq custom-file (expand-file-name "custom.el" config-root))
  (load custom-file 'no-error 'no-message)
  (require 'kbd)
  (add-to-list 'load-path (expand-file-name "config" config-root))
  (require 'config-entry))

(provide 'entry)
