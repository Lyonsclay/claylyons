(defconst claylyons-packages

  `(
    ;; flycheck-dialyxir
    ;; flycheck-dogma
    key-chord
    multiple-cursors))


;; (defun claylyons/init-flycheck-dialyxir ()
;;   (use-package flycheck-dialyxir
;;     :defer t))

;; (defun claylyons/init-flycheck-dogma ()
;;   (use-package flycheck-dogma
;;     :defer t))

(defun claylyons/init-multiple-cursors ()
  (use-package multiple-cursors
    :config
    ;; When you have an active region that spans multiple lines, the following will
    ;; add a cursor to each line:


    (progn
      (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

      ;; When you want to add multiple cursors not based on continuous lines, but based on
      ;; keywords in the buffer, use:

      (global-set-key (kbd "C->") 'mc/mark-next-like-this)
      (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
      (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
      )))
;; I prefer that Dired remember my omit state: when enabling/disabling ‘omit-mode’,
;; the ‘omit-mode’ remains enabled/disabled in another Dired buffer. This code does that:
;; https://www.emacswiki.org/emacs/DiredOmitMode

;; (defvar v-dired-omit t
;;   "If dired-omit-mode enabled by default. Don't setq me.")
;; (defun dired-omit-switch ()
;;   "This function is a small enhancement for `dired-omit-mode', which will
;;    \"remember\" omit state across Dired buffers."
;;   (interactive)
;;   (if (eq v-dired-omit t)
;;       (setq v-dired-omit nil)
;;     (setq v-dired-omit t))
;;   (dired-omit-caller)
;;   (revert-buffer))

;; (defun dired-omit-caller ()
;;   (if v-dired-omit
;;       (setq dired-omit-mode t)
;;     (setq dired-omit-mode nil)))

;; (defun claylyons/init-dired-x ()
;;   (use-package dired-x
;;     :config
;;     (progn
;;       (define-key dired-mode-map (kbd "C-x M-o") 'dired-omit-switch)
;;        (add-hook 'dired-mode-hook 'dired-omit-caller)
;;         (dired-omit-files "^\\.?#\\|\\.DS_Store"))))
(defun claylyons/init-key-chord ()
  (use-package key-chord
    :init
    (key-chord-mode 1)
    :config
    (progn
      (key-chord-define-global "jk" 'evil-normal-state)
      (key-chord-define-global "JK" 'evil-normal-state)
      )))
