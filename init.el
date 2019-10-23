;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode，在窗口版中才有这个模式
;; (tool-bar-mode -1)

;; 关闭滚动条，在窗口版中才有
;; (scroll-bar-mode -1)

;; 更改光标显示样式，这一行为什么还跑步起来不知道，是不是因为只有在窗口版下才生效？
;; (setq-default cursor-type 'bar)

;; 显示行号
(global-linum-mode 1)

;; 高亮当前行
(global-hl-line-mode 1)

;; 显示最近打开文件
(recentf-mode 1)

;; 显示匹配的括号，但是好像只显示了圆括号
(show-paren-mode 1)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 这个 mode 可以在选择状态下，输入的文字时将直接替换被选中的文字
(delete-selection-mode 1)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)

;; 开启全局 Company 补全
(global-company-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))
