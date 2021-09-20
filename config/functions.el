;;; functions.el --- My custom emacs functions

;;; Commentary:

;;; Code:

(defun comment-uncomment-region-or-line ()
  "Comment or uncomment highlighted region or line."
  (interactive)
  (if mark-active
    (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(defun kill-region-or-line ()
  "Kill a selected region or line."
  (interactive)
  (if mark-active
    (kill-region (region-beginning) (region-end))
    (kill-whole-line)))

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

(defun maybe-enable-prettier ()
  "Enables prettier-mode if a .prettierrc exists."
  (if
    (locate-dominating-file default-directory ".prettierrc")
    (prettier-mode)))

(defun open-remote-file ()
  "Open a file on a remote machine over SSH."
  (interactive)
  (let
    (
      (user (read-string "User: "))
      (hostname (read-string "Hostname: ")))
    (find-file (concat "/ssh:" user "@" hostname ":/"))))

(defun select-flycheck-eslint-if-eslint-exists-locally ()
  "Select the flycheck eslint checker if a local eslint executable exists in project."
  (flycheck-mode t)
  (when (executable-find "eslint")
    (flycheck-select-checker 'javascript-eslint)))

(provide 'functions.el)
;;; functions.el ends here
