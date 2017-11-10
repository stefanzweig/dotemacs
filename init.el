(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(setq initial-scratch-message nil)
(load "~/.emacs.d/personal/defuns")


;; self managed
;; ------------------

(personal 'bindings)
(personal 'c)
(personal 'diff)
(personal 'dired)
(personal 'disabled)
(personal 'flymake)
(personal 'fonts)
(personal 'global)
(personal 'grep)
(personal 'ido)
(personal 'javascript)
(personal 'kbd-macros)
(personal 'mac)
(personal 'org)
(personal 'private)
(personal 'recentf)
(personal 'rectangle)
(personal 'saveplace)
(personal 'scratch)
(personal 'server-mode)
(personal 'shell-mode)
(personal 'tabs)
(personal 'dash)
(personal 'solarized)
(personal 'theme)
(personal 'color-moccur)
(personal 'moccur-edit)
(personal 'utf-8)
(personal 'zoom)
(personal 'zweig)

;; elpa managed
;; ------------------
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                       ("org-cn"   . "http://elpa.zilongshanren.com/org/")
                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))


(package 'smex)
(package 'expand-region)
(package 'company)
; the following packages are marked by stefan
; (package 'ag)
; (package 'projectile)
; (package 'browse-kill-ring+)
; (package 'powerline)
; (package 'bundler)
; (package 'coffee-mode)
; (package 'csv-mode)
; (package 'dired-details+)
; (package 'dropdown-list)
; (package 'exec-path-from-shell)
; (package 'feature-mode)
; (package 'flx-ido)
; (package 'flx-isearch)
; (package 'haml-mode)
; (package 'htmlize)
; (package 'js2-mode)
; (package 'lua-mode)
; (package 'magit-gh-pulls)
; (package 'markdown-mode)
; (package 'maxframe)
; (package 'motion-mode)
; (package 'projectile-rails)
; (package 'rbenv)
; (package 'ruby-guard)
; (package 'sass-mode)
; (package 'shell-pop)
; (package 'toggle-quotes)
; (package 'textile-mode)
; (package 'yaml-mode)
; (package 'yasnippet)

;; submodule managed
;; ------------------
(add-to-list 'load-path "~/.emacs.d/vendor/")

;;(vendor 'feature-mode)
;;(vendor 'filladapt)
;;(vendor 'insert-time   'insert-time 'insert-date 'insert-date-time 'insert-personal-time-stamp)
;;(vendor 'electric-align 'electric-align-mode)
