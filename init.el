;; 显示最近打开文件
(recentf-mode 1)

;; 显示匹配的括号，但是好像只显示了圆括号
(show-paren-mode 1)

;; 这个 mode 可以在选择状态下，输入的文字时将直接替换被选中的文字
(delete-selection-mode 1)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-ui)
;; common functions and keybinds
(require 'init-utils)

;; 开启全局 Company 补全
(global-company-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))
