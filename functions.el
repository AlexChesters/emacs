;;; functions.el --- My custom emacs functions

;;; Commentary:

;;; Code:

(defun comment-uncomment-region-or-line ()
  "Comment or uncomment highlighted region or line."
  (interactive)
  (if mark-active
    (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(provide 'functions.el)
;;; functions.el ends here
