;;; -*- lexical-binding: t -*-

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(set-face-attribute 'default nil :font "JetBrains Mono-14")
(set-fontset-font t 'han (font-spec :family "等距更纱黑体 SC"))
;; CJK 字宽必须是拉丁字宽的整 2 倍，org 表格才对得齐（string-width 模型 = 2:1）。
;; 实测 hb-shape --font-size=1400：JetBrains Mono 的 M = 840，Sarasa Mono SC 的
;; 中 = 1400、M = 700。拉丁走 JetBrains、汉字走 Sarasa，故实际比例 1400/840 = 1.667，
;; 需放大 2*840/1400 = 1.2 倍才等于两个拉丁字宽。换字体后按同法重算：
;; ratio = 2 * 拉丁字宽 / 汉字字宽（两者按同一 font-size 度量）。
;; 同时匹配中英文 family 名，避免 fontconfig 报英文名时本条失效。
(setq face-font-rescale-alist
      '(("Sarasa Mono SC\\|等距更纱黑体 SC" . 1.2)))


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
