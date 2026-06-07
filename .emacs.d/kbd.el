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

(defun custom-split-window-and-new-scratch (window-direction)
  (let ((split-func (if (eq window-direction 'right)
			#'split-window-right
		      #'split-window-below)))
    (funcall split-func))
  (other-window 1)
  (let* ((new-buffer-name (generate-new-buffer-name "*scratch*"))
	 (new-buffer (get-buffer-create new-buffer-name)))
    (switch-to-buffer new-buffer)
    (lisp-interaction-mode)
    (when initial-scratch-message
      (insert (substitute-command-keys initial-scratch-message)))
    (set-buffer-modified-p nil)))
(global-set-key (kbd "C-c C-w h")
		(lambda ()
		  (interactive)
		  (custom-split-window-and-new-scratch 'right)))
(global-set-key (kbd "C-c C-w v")
		(lambda ()
		  (interactive)
		  (custom-split-window-and-new-scratch 'below)))

(provide 'kbd)
