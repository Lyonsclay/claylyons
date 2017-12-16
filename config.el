(setq-default dotspacemacs-default-font '("Fira Mono for Powerline")
                            :size 14
                            :weight light
                            :width normal
                            :powerline-scale 1.1

  (add-hook 'focus-out-hook
            (defun save-current-buffer-if-needed ()
              (interactive)
              (when (and (buffer-file-name) (buffer-modified-p))
                (save-buffer))))
  (add-hook 'dired-load-hook
            (function (lambda () (load "dired-x"))))

  ;; (add-hook 'dired-mode-hook
  ;;           (lambda ()
  ;;             ;; Set dired-x buffer-local variables here.  For example:
  ;;             (dired-omit-mode 1)))
  (require 'dired-x)
  (setq-default dired-omit-files-p t) ; Buffer-local variable
  ;; '(dired-omit-files "^\\.?#\\|\\.DS_Store")

  (require 'multiple-cursors)

  ;; When you have an active region that spans multiple lines, the following will
  ;; add a cursor to each line:

  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

  ;; When you want to add multiple cursors not based on continuous lines, but based on
  ;; keywords in the buffer, use:

  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

  ;; First mark the word, then add more cursors.

  ;; To get out of multiple-cursors-mode, press `<return>` or `C-g`. The latter will
  ;; first disable multiple regions before disabling multiple cursors. If you want to
  ;; insert a newline in multiple-cursors-mode, use `C-j`.

  (global-set-key (kbd "M-[") 'insert-pair)
  (global-set-key (kbd "M-{") 'insert-pair)
  (global-set-key (kbd "M-\"") 'insert-pair)
  (global-set-key (kbd "M-'") 'insert-pair)
  (global-set-key (kbd "M-`") 'insert-pair)
  (global-set-key (kbd "M-(") 'insert-pair)
  (global-set-key (kbd "M-)") 'delete-pair)

  (setq evil-escape-key-sequence "jk")
  ;;-----remapping the esc key with key-chord---------
  ;; (require 'key-chord)
  ;; (key-chord-mode 1)
  ;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  ;; (key-chord-define evil-insert-state-map "JK" 'evil-normal-state)


  (spacemacs/set-leader-keys "wB" (lambda() (interactive) (evil-window-increase-height 5))))
