;;; functions.el --- My custom emacs functions

;;; Commentary:

;;; Code:

(defun comment-uncomment-region-or-line ()
  "Comment or uncomment highlighted region or line."
  (interactive)
  (if mark-active
    (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(defun kill-all-buffers ()
  "Close all open buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (delete-window))

(defun kill-all-other-buffers ()
  "Close all open buffers, except the current one."
  (interactive)
  (mapc 'kill-buffer
    (delq (current-buffer)
      (buffer-list))))

(provide 'functions.el)
;;; functions.el ends here
