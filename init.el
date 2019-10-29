;; 显示匹配的括号，但是好像只显示了圆括号
(show-paren-mode 1)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)
;; common functions and keybinds
(require 'init-utils)
(require 'init-editor)

;; 开启全局 Company 补全
(global-company-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))
