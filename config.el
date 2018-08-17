;; Package claylyons spacemacs config layer.
(defun save-all ()
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)
;; (add-hook 'focus-out-hook
;;           (defun save-current-buffer-if-needed ()
;;             (interactive)
;;             (when (and (buffer-file-name) (buffer-modified-p))
;;               (save-buffer))))
;; I prefer that Dired remember my omit state: when enabling/disabling ‘omit-mode’,
;; the ‘omit-mode’ remains enabled/disabled in another Dired buffer. This code does that:
;; https://www.emacswiki.org/emacs/DiredOmitMode
(defvar v-dired-omit t
  "If dired-omit-mode enabled by default. Don't setq me.")
(defun dired-omit-switch ()
  "This function is a small enhancement for `dired-omit-mode', which will
   \"remember\" omit state across Dired buffers."
  (interactive)
  (if (eq v-dired-omit t)
      (setq v-dired-omit nil)
    (setq v-dired-omit t))
  (dired-omit-caller)
  (revert-buffer))

(defun dired-omit-caller ()
  (if v-dired-omit
      (setq dired-omit-mode t)
    (setq dired-omit-mode nil)))

;; (define-key dired-mode-map (kbd "C-x M-o") 'dired-omit-switch)
;; (add-hook 'dired-mode-hook 'dired-omit-caller)

;; (require dired-x)
;; (add-hook 'dired-load-hook
;;           (function (lambda ()
;;                       ;; (load "dired-x")
;;                       ;; (dired-omit-mode 1)
;;                       '(dired-omit-files "^\\.?#\\|\\.DS_Store")
;;                       '(dired-omit-caller))))
;; 

(spacemacs/set-leader-keys "wB" (lambda() (interactive) (evil-window-increase-height 5)))
(defun raise-window ()
  (ineractive)
  (evil-window-increase-height 15))
(spacemacs/set-leader-keys "wB" 'raise-window)


