;;; init-packages.el --- Init pacakges

(require 'cl)
(require 'package)

;; 使用中国镜像
(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
	("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(defvar my/packages
  '(
    ;; --- Auto-completion ---
    company
    ;; --- Smart parentheses ---
    smartparens
    ) "Default packages")

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

(provide 'init-packages)
