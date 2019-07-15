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

(require 'package)
(package-initialize)
;; 使用中国镜像
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(require 'cl)

(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company

		      ;; --- Smart parentheses ---
		      smartparens
		      ) "Default packages")

;; 这一行是为了替换掉 custom-set-variables 中自动生成的 '(package-selected-packages (qoute company)) 。我们自己安装的插件不应该声明两遍。
;; 发现，如果直接在那里修改成为 ‘my/packages，在触发自动装插件，或者 package-autoremove后，他会重写那一行。用这个 setq 可以解决这个问题。
;; 但是发现还有小瑕疵，当这个变量为空列表时，还是有之前的问题，但也还好，不要空就好了。
(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

;; this line equals (if (my/packages-installed-p) nil
(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 开启全局 Company 补全
(global-company-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

