;;; init-ui.el --- UI optimizations

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; disable the annoying bell ring
;; (setq ring-bell-function 'ignore)

;; disable startup screen
;; (setq inhibit-startup-screen t)

;; line settings
(global-linum-mode t)
(global-hl-line-mode t)
(column-number-mode t)

;; 字数统计
(size-indication-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-ui)

