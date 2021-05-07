;;; keys.el --- Custom keybindings

;;; Commentary:

;;; Code:

;; packages

;; Counsel
(global-set-key (kbd "M-x") 'counsel-M-x) ; Alt+x, Counsel

;; Drag-stuff
(global-set-key (kbd "s-<up>") 'drag-stuff-up)
(global-set-key (kbd "s-<down>") 'drag-stuff-down)

;; ibuffer
(global-set-key (kbd "s-i") 'ibuffer) ; Cmd+i, ibuffer

;; Projectile
(global-set-key (kbd "M-<tab>") 'projectile-find-file)

;; shell-pop
(global-set-key (kbd "s-t") 'shell-pop); Cmd+t, open shell

;; VC things
(define-prefix-command 'vc-map)
(global-set-key (kbd "C-c v") 'vc-map)
(define-key 'vc-map (kbd "s") 'magit-status)
(define-key 'vc-map (kbd "p") 'magit-push-current)
(define-key 'vc-map (kbd "P") 'magit-pull-current)
(define-key 'vc-map (kbd "c") 'vc-next-action)

;; general keybinds

;; Buffer interaction
(define-prefix-command 'buffer-map)
(global-set-key (kbd "C-c b") 'buffer-map)
(define-key 'buffer-map (kbd "<return>") 'eval-buffer)
(global-set-key (kbd "s-F") 'delete-other-windows) ; Cmd+F, delete all other windows

;; Navigation
(global-set-key (kbd "M-s-<left>") 'windmove-left) ; Cmd+alt+left, Move left buffer
(global-set-key (kbd "M-s-<right>") 'windmove-right) ; Cmd+alt+right, Move right buffer
(global-set-key (kbd "M-s-<up>") 'windmove-up) ; Cmd+alt+up, Move up buffer
(global-set-key (kbd "M-s-<down>") 'windmove-down) ; Cmd+alt+down, Move down buffer
(global-set-key (kbd "s-<right>") 'next-buffer) ; Cmd+right-arrow, moves to next buffer
(global-set-key (kbd "s-<left>") 'previous-buffer) ; Cmd+left-arrow, moves to previous buffer
(global-set-key (kbd "s-f") 'helm-find-files) ; Cmd+f, find file
(global-set-key (kbd "s-w") 'kill-buffer-and-window); Cmd+w, close buffer

(provide 'keys)
;;; keys.el ends here
