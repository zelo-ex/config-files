;;; -*- lexical-binding: t -*-

(use-package restart-emacs
  :ensure t
  :commands restart-emacs
  :bind (("C-c r" . restart-emacs))
  :config
  (setq restart-emacs-restore-frames t))

(defun delete-line-no-kill ()
  (interactive)
  (delete-region (line-beginning-position) (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1))
(global-set-key (kbd "C-k") 'delete-line-no-kill)

(provide 'kbd)
