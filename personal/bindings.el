;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)

;; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

(global-set-key (kbd "M-O") 'rotate-windows)

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window
;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Mac OS X conventions
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Easy inserts
(global-set-key (kbd "C-.") 'insert-arrow)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Easier buffer killing
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-K") 'kill-this-buffer)

;; Improved navigation and editing (assumes misc.el)
(global-set-key (kbd "M-Z") 'zap-up-to-char)
(global-set-key (kbd "M-F") 'forward-to-word)
(global-set-key (kbd "M-B") 'backward-to-word)

(global-set-key (kbd "<f2>") 'xah-cut-line-or-region) ; cut.
(global-set-key (kbd "<f3>") 'xah-copy-line-or-region) ; copy.
(global-set-key (kbd "<f4>") 'yank) ; paste.

(global-set-key (kbd "<f6>") 'org-capture)
(global-set-key (kbd "<f7>") 'org-agenda)
;; indenting and alignment
(global-set-key (kbd "<f8>")  'indent-region)
(global-set-key (kbd "C-<f8>") 'align)
(global-set-key (kbd "S-<f8>") 'align-current)
(global-set-key (kbd "M-<f8>") 'align-regexp)
;; <f10> for system use
(global-set-key (kbd "<f11>") 'prelude-copy-file-name-to-clipboard)
(global-set-key (kbd "C-<f11>") 'xah-search-current-word)

;; Personal textmate.el bindings
(global-set-key (kbd "C-c f") 'textmate-goto-file)
(global-set-key [(control return)] 'textmate-next-line)

;; Tags
(global-set-key (kbd "M-,") 'pop-tag-mark) ; was tags-loop-continue

;; Goto Line
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "s-\\") 'fixup-whitespace)

;; Help teach to unlearn the arrow keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
