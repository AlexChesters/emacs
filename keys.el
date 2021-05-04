;; Buffer interaction
(define-prefix-command 'buffer-map)
(global-set-key (kbd "C-c b") 'buffer-map)
(define-key 'buffer-map (kbd "<return>") 'eval-buffer)
(global-set-key (kbd "s-F") 'delete-other-windows) ; Cmd+F, delete all other windows

;; Navigation
(global-set-key (kbd "s-f") 'find-file) ; Cmd+f, find file
(global-set-key (kbd "s-w") 'kill-this-buffer); Cmd+w, close buffer

;; VC things
(define-prefix-command 'vc-map)
(global-set-key (kbd "C-c v") 'vc-map)
(define-key 'vc-map (kbd "s") 'magit-status)
(define-key 'vc-map (kbd "p") 'magit-push-current)
(define-key 'vc-map (kbd "P") 'magit-pull-current)
(define-key 'vc-map (kbd "c") 'vc-next-action)
