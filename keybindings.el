;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-\'") 'insert-pair)
(global-set-key (kbd "M-(") 'insert-pair)
(global-set-key (kbd "M-`") 'insert-pair)
(global-set-key (kbd "M-)") 'delete-pair)

;; (setq evil-escape-key-sequence "jk")

;; doesn't work outside parent init.el ??
;; (defun claylyons/raise-window ()
;;   (interactive) (evil-window-increase-height 15))

;; ;; (spacemacs/set-leader-keys "wB" (lambda() (interactive) (evil-window-increase-height 5)))
;; (spacemacs/set-leader-keys "wB" #'claylyons/raise-window)
