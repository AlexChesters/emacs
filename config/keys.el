;;; keys.el --- Custom keybindings

;;; Commentary:

;;; Code:

;; packages

;; Drag-stuff
(global-set-key (kbd "s-<up>") 'drag-stuff-up)
(global-set-key (kbd "s-<down>") 'drag-stuff-down)

;; ibuffer
(global-set-key (kbd "s-i") 'ibuffer) ; Cmd+i, ibuffer

;; helm
(global-set-key (kbd "M-x") 'helm-M-x) ; Alt+x
(global-set-key (kbd "s-S") 'helm-ag-project-root)

;; Projectile
(global-set-key (kbd "M-<tab>") 'projectile-find-file) ; Alt+Tab, projectile-find-file
(global-set-key (kbd "s-o") 'projectile-switch-project); Cmd+o, open new projectile project

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

;; Editing
(global-set-key (kbd "s-k") 'kill-whole-line) ; Cmd+k, Deleting the whole line
(global-set-key (kbd "s-/") 'comment-uncomment-region-or-line) ; Cmd+k, comment/uncomment the selected region or line

;; Navigation
(global-set-key (kbd "M-s-<left>") 'windmove-left) ; Cmd+alt+left, Move left buffer
(global-set-key (kbd "M-s-<right>") 'windmove-right) ; Cmd+alt+right, Move right buffer
(global-set-key (kbd "M-s-<up>") 'windmove-up) ; Cmd+alt+up, Move up buffer
(global-set-key (kbd "M-s-<down>") 'windmove-down) ; Cmd+alt+down, Move down buffer
(global-set-key (kbd "s-<right>") 'next-buffer) ; Cmd+right-arrow, moves to next buffer
(global-set-key (kbd "s-<left>") 'previous-buffer) ; Cmd+left-arrow, moves to previous buffer
(global-set-key (kbd "s-f") 'helm-find-files) ; Cmd+f, find file
(global-set-key (kbd "s-w") 'kill-buffer-and-window); Cmd+w, close buffer
(global-set-key (kbd "s-W") 'kill-all-buffers); Cmd+w, close all buffers
(global-set-key (kbd "s-F")
  (lambda ()
    (interactive)
    (delete-other-windows)
    (kill-all-other-buffers)))

(provide 'keys)
;;; keys.el ends here
