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

(defun claylyons/utop () (use-package utop
                           :config
                           (progn
                             (require 'utop)
                             (setq utop-command "opam config exec -- rtop -emacs")
                             (add-hook 'reason-mode-hook #'utop-minor-mode) ;; can be included in the hook above as well

                             )
                           ))

(defun claylyons/init-reason-mode ()
  (use-package reason-mode
    :config
    (progn
     ;;----------------------------------------------------------------------------
;; Reason setup
;;----------------------------------------------------------------------------

; (defun shell-cmd (cmd)
  ; "Returns the stdout output of a shell command or nil if the command returned
   ; an error"
  ; (car (ignore-errors (apply 'process-lines (split-string cmd)))))
;
; (defun reason-cmd-where (cmd)
  ; (let ((where (shell-cmd cmd)))
    ; (if (not (string-equal "unknown flag ----where" where))
      ; where)))
;
; (let* ((refmt-bin (or (reason-cmd-where "refmt ----where")
                      ; (shell-cmd "which refmt")))
       ; (merlin-bin (or (reason-cmd-where "ocamlmerlin ----where")
                       ; (shell-cmd "which ocamlmerlin")))
       ; (merlin-base-dir (when merlin-bin
                          ; (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
  ; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
  ; (when merlin-bin
    ; (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
    ; (setq merlin-command merlin-bin))
;
  ; (when refmt-bin
    ; (setq refmt-command refmt-bin)))
;
; (require 'reason-mode)
; (require 'merlin)
; (add-hook 'reason-mode-hook (lambda ()
                              ; (add-hook 'before-save-hook 'refmt-before-save)
                              ; (merlin-mode)))
;
; (setq merlin-ac-setup t)
; )
;

))
;; (defun claylyons/init-multiple-cursors ()
;;   (use-package multiple-cursors
;;     :config
;;     ;; When you have an active region that spans multiple lines, the following will
;;     ;; add a cursor to each line:


;;     (progn
;;       (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;;       ;; When you want to add multiple cursors not based on continuous lines, but based on
;;       ;; keywords in the buffer, use:

;;       (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;       (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;       (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;       )))
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

(defun claylyons/init-windmove ()
  (use-package windmove
    :init
    (windmove-default-keybindings 'super)
    :config
    (progn
      ;; automatically save buffers associated with files on buffer switch
      ;; and on windows switch
      (defadvice switch-to-buffer (before save-buffer-now activate)
        (when buffer-file-name (save-buffer)))
      (defadvice other-window (before other-window-now activate)
        (when buffer-file-name (save-buffer)))
      (defadvice windmove-up (before other-window-now activate)
        (when buffer-file-name (save-buffer)))
      (defadvice windmove-down (before other-window-now activate)
        (when buffer-file-name (save-buffer)))
      (defadvice windmove-left (before other-window-now activate)
        (when buffer-file-name (save-buffer)))
      (defadvice windmove-right (before other-window-now activate)
        (when buffer-file-name (save-buffer)))
      )))

;; (defun claylyons/elixir ()
;;  (use-package elixir
;;    :config
;;      ;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
;;      (add-hook 'elixir-mode-hook
;;                (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))))


;; ;; use shift + arrow keys to switch between visible buffers
;; (require 'windmove)
;; (windmove-default-keybindings 'super)

;; ;; automatically save buffers associated with files on buffer switch
;; ;; and on windows switch
;; (defadvice switch-to-buffer (before save-buffer-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice other-window (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice windmove-up (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice windmove-down (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice windmove-left (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice windmove-right (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))
