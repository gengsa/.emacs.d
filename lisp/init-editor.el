;;; init-editor.el --- Editor optimizations

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; recent files
(recentf-mode t)

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

(delete-selection-mode t)

;; add final newline, and delete trailing whitespace/lines
(setq require-final-newline t)
(setq delete-trailing-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-editor)
