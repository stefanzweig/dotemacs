;; Show ascii table
(defun ascii-table ()
  "Print the ascii table"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

;;; Insert date into buffer
(defun insert-date-simple ()
  "Insert date at point"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M")))

;;; Convert a buffer from dos ^M end of lines to unix end of lines
(defun dos2unix ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

;;; Vice versa
(defun unix2dos ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))

;; Arrows are common, especially in ruby
(defun insert-arrow ()
  (interactive)
  (delete-horizontal-space)
  (insert " => "))

(defun xah-search-current-word ()
  "Call `isearch' on current word or text selection.
  URL `http://ergoemacs.org/emacs/modernization_isearch.html'
  Version 2015-04-09"
  (interactive)
  (let ( lambdap1 lambdap2 )
    (if (use-region-p)
        (progn
          (setq lambdap1 (region-beginning))
          (setq lambdap2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq lambdap1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq lambdap2 (point))))
    (setq mark-active nil)
    (when (< lambdap1 (point))
      (goto-char lambdap1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties lambdap1 lambdap2))))

(defun indent-defun ()
  "Indent current defun.
Do nothing if mark is active (to avoid deactivaing it), or if
buffer is not modified (to avoid creating accidental
modifications)."
  (interactive)
  (unless (or (region-active-p)
              buffer-read-only
              (null (buffer-modified-p)))
    (let ((l (save-excursion (beginning-of-defun 1) (point)))
          (r (save-excursion (end-of-defun 1) (point))))
      (cl-letf (((symbol-function 'message) #'ignore))
        (indent-region l r)))))

(defun activate-aggressive-indent ()
  "Locally add `ha/indent-defun' to `post-command-hook'."
  (add-hook 'post-command-hook
            'indent-defun nil 'local))

(add-hook 'emacs-lisp-mode-hook 'activate-aggressive-indent)

(defun insert-date (str)
  "Insert current date in ISO 8601.
    Typing 'v' will insert the current date verbosely.
    Typing 't' will append the time in H:M:S to either format."
  (interactive "sType (v) for verbose date | (t) for time: ")
  (if (string-match-p "v" str)
      (insert (format-time-string "%B %e, %Y"))
    (insert (format-time-string "%Y-%m-%d")))
  (when (string-match-p "t" str)
    (insert (format-time-string " %T"))))

(define-skeleton insert-iso-date-skeleton
  "Skeleton wrapper for INSERT-DATE"
  "ISO Date"
  '(insert-date ""))

(define-skeleton insert-verbose-date-skeleton
  "Skeleton wrapper for INSERT-DATE"
  "Verbose Date"
  '(insert-date "v"))

(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-06-10"
  (interactive)
  (if current-prefix-arg
      (progn ; not using kill-region because we don't want to include previous kill
        (kill-new (buffer-string))
        (delete-region (point-min) (point-max)))
    (progn (if (use-region-p)
               (kill-region (region-beginning) (region-end) t)
             (kill-region (line-beginning-position) (line-beginning-position 2))))))

(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When called repeatedly, append copy subsequent lines.
When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2016-06-18"
  (interactive)
  (let (-p1 -p2)
    (if current-prefix-arg
        (setq -p1 (point-min) -p2 (point-max))
      (if (use-region-p)
          (setq -p1 (region-beginning) -p2 (region-end))
        (setq -p1 (line-beginning-position) -p2 (line-end-position))))
    (if (eq last-command this-command)
        (progn
          (progn ; hack. exit if there's no more next line
            (end-of-line)
            (forward-char)
            (backward-char))
          ;; (push-mark (point) "NOMSG" "ACTIVATE")
          (kill-append "\n" nil)
          (kill-append (buffer-substring-no-properties (line-beginning-position) (line-end-position)) nil)
          (message "Line copy appended"))
      (progn
        (kill-ring-save -p1 -p2)
        (if current-prefix-arg
            (message "Buffer text copied")
          (message "Text copied"))))
    (end-of-line)
    (forward-char)
    ))