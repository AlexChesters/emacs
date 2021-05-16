;;; keys.el --- Custom keybindings

;;; Commentary:

;;; Code:

;; packages

;; company-mode
(global-set-key (kbd "<backtab>") 'company-complete)

;; Drag-stuff
(global-set-key (kbd "s-<up>") 'drag-stuff-up)
(global-set-key (kbd "s-<down>") 'drag-stuff-down)

;; ibuffer
(global-set-key (kbd "s-i") 'ibuffer) ; Cmd+i, ibuffer

;; git-timemachine
(global-set-key (kbd "s-g") 'git-timemachine) ; Cmd+g, open git-timemachine

;; helm
(global-set-key (kbd "M-x") 'helm-M-x) ; Alt+x
(global-set-key (kbd "s-S") 'helm-ag-project-root) ; Cmd+S
(global-set-key (kbd "C-s") 'helm-swoop) ; Ctrl+s

;; Projectile
(global-set-key (kbd "M-<tab>") 'projectile-find-file) ; Alt+Tab, projectile-find-file
(global-set-key (kbd "s-o") 'projectile-switch-project) ; Cmd+o, open new projectile project
(global-set-key (kbd "C-<tab>") 'projectile-dired) ; Cntl+Tab, open project dir

;; shell-pop
(global-set-key (kbd "s-t") 'shell-pop); Cmd+t, open shell

;; tide
(global-set-key (kbd "s-r") 'tide-rename-symbol)

;; VC things
(define-prefix-command 'vc-map)
(global-set-key (kbd "C-c v") 'vc-map)
(define-key 'vc-map (kbd "s") 'magit-status)
(define-key 'vc-map (kbd "p") 'magit-push-current)
(define-key 'vc-map (kbd "P") 'magit-pull-current)
(define-key 'vc-map (kbd "c") 'vc-next-action)

;; general keybinds
(global-set-key (kbd "C-q") 'restart-emacs)

;; Buffer interaction
(define-prefix-command 'buffer-map)
(global-set-key (kbd "C-c b") 'buffer-map)
(define-key 'buffer-map (kbd "<return>") 'eval-buffer)

;; Editing
(global-set-key (kbd "s-k") 'kill-region-or-line) ; Cmd+k, delete the selected region or line
(global-set-key (kbd "s-/") 'comment-uncomment-region-or-line) ; Cmd+k, comment/uncomment the selected region or line
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; Navigation
(global-set-key (kbd "M-s-<left>") 'windmove-left) ; Cmd+alt+left, Move left buffer
(global-set-key (kbd "M-s-<right>") 'windmove-right) ; Cmd+alt+right, Move right buffer
(global-set-key (kbd "M-s-<up>") 'windmove-up) ; Cmd+alt+up, Move up buffer
(global-set-key (kbd "M-s-<down>") 'windmove-down) ; Cmd+alt+down, Move down buffer
(global-set-key (kbd "s-<right>") 'next-buffer) ; Cmd+right-arrow, moves to next buffer
(global-set-key (kbd "s-<left>") 'previous-buffer) ; Cmd+left-arrow, moves to previous buffer
(global-set-key (kbd "s-f") 'helm-find-files) ; Cmd+f, find file
(global-set-key (kbd "s-w") 'kill-buffer-and-window); Cmd+w, close buffer
(global-set-key (kbd "s-W") 'kill-all-buffers) ; Cmd+w, close all buffers
(global-set-key (kbd "s-R") 'open-remote-file) ; Cmd+r, open a remote file
(global-set-key (kbd "s-F")
  (lambda ()
    (interactive)
    (delete-other-windows))) ; Cmd+F, delete other windows
(global-set-key (kbd "s-I")
  (lambda ()
    (interactive)
    (find-file "~/.emacs.d/"))) ; Cmd+I, opens my .emacs.d directory
(global-set-key (kbd "s-d")
  (lambda ()
    (interactive)
    (dired default-directory))) ; Cmd+d, opens dired at the current directory

(provide 'keys)
;;; keys.el ends here
