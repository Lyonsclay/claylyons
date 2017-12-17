;; Package claylyons spacemacs config layer.
(add-hook 'focus-out-hook
          (defun save-current-buffer-if-needed ()
            (interactive)
            (when (and (buffer-file-name) (buffer-modified-p))
              (save-buffer))))
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

;;-----remapping the esc key with key-chord---------
;; (require 'key-chord)
;; (key-chord-mode 1)
;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
;; (key-chord-define evil-insert-state-map "JK" 'evil-normal-state)

(spacemacs/set-leader-keys "wB" (lambda() (interactive) (evil-window-increase-height 5)))
