(defconst claylyons-packages

  `(
    multiple-cursors
    (tmux :excluded t)
    dired-x))


(defun claylyons/init-multiple-cursors ()
  (use-package multiple-cursors
    :defer t
    :config
    ;; When you have an active region that spans multiple lines, the following will
    ;; add a cursor to each line:

    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

    ;; When you want to add multiple cursors not based on continuous lines, but based on
    ;; keywords in the buffer, use:

    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)))

(defun claylyons/init-dired-x ()
  (use-package dired-x
    :defer t
    :config
    ;; (add-hook 'dired-mode-hook
    ;;           (lambda ()
    ;;             ;; Set dired-x buffer-local variables here.  For example:
    ;;             (dired-omit-mode 1)))
    (setq-default dired-omit-files-p t) ; Buffer-local variable
    '(dired-omit-files "^\\.?#\\|\\.DS_Store")))
