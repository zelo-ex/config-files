;;; -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :if window-system
  :config (exec-path-from-shell-initialize))

(use-package aidermacs
  :bind (("C-c a" . aidermacs-transient-menu))
  :custom
  (aidermacs-default-chat-mode 'architect)
  (aidermacs-default-model "deepseek/deepseek-v4-pro"))

(provide 'config-utils-aidermacs)
