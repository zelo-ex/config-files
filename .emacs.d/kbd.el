;;; -*- lexical-binding: t -*-

(use-package restart-emacs
  :ensure t
  :commands restart-emacs
  :bind (("C-c r" . restart-emacs))
  :config
  (setq restart-emacs-restore-frames t))

(defun foreward-delete-line-no-kill ()
  (interactive)
  (delete-region (line-beginning-position) (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1))
(global-set-key (kbd "M-k") 'foreward-delete-line-no-kill)

(defun backward-delete-line-no-kill ()
  (interactive)
  (let ((prev-end (save-excursion
                    (unless (bobp)
                      (forward-line -1)
                      (end-of-line)
                      (point)))))
    (delete-region (line-beginning-position)
                   (save-excursion (move-end-of-line 1) (point)))
    (unless (eobp)
      (delete-char 1))
    (if prev-end
        (goto-char prev-end) 
      (progn
        (message "Beginning of Buffer.")))))
(global-set-key (kbd "C-k") 'backward-delete-line-no-kill)

(defun custom-mark-comment ()
  (interactive)
  (let ((beg (line-beginning-position))
        (end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-M-;") 'custom-mark-comment)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-c C-n") 'dired-create-empty-file))

(provide 'kbd)
