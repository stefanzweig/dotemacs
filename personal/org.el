;; org-mode

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (global-set-key (kbd "C-c r") 'remember)
(setq org-log-done t)

(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)

;; currently python and sh are supported.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh         . t)
   (js         . t)
   (emacs-lisp . t)
   (perl       . t)
   (scala      . t)
   (clojure    . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (css        . t)
   (plantuml   . t)))

(setq org-agenda-files (list "~/org/agenda.org"))
(setq org-default-notes-file "~/org/notes.org")

(setq org-capture-templates
      '(("j" "Journal" entry (file+datetree "~/org/journal.org")
         "** %^{Heading}")))

;; org mode agenda customized commands
(setq org-agenda-custom-commands
      '(("D" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up))))
                      (org-deadline-warning-days 0)))))))
