;;; misc.el --- Miscellaneous configuration

;;; Commentary:

;;; Code:

;; indent config
(setq-default tab-width 2) ; Default tab-width
(setq-default indent-tabs-mode nil) ; Use spaces over tabs
(setq indent-line-function 'insert-tab)
(setq lisp-indent-offset 2) ; Setting the indent level for lisp
(setq-default typescript-indent-level 2) ; typescript indent level
(add-hook 'text-mode-hook
  (lambda ()
    (setq tab-width 0))) ; ensuring text-mode's (e.g. magit commit messages) don't indent

(delete-selection-mode 1) ; Deleting selected text if typed in/pasted
(setq make-backup-files nil) ; Preventing backup (~) files
(fset 'yes-or-no-p 'y-or-n-p) ; Use y or n instead of yes or no
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; Hide scroll bar
(show-paren-mode 1) ; Always show matching parenthesis
(delete-selection-mode 1) ; Deleting selected text if typed in/pasted

(add-hook 'before-save-hook 'whitespace-cleanup) ; clean whitespace on every save

;; by default python binds backtab to a deindent line function
;; the below means that that binding is removed, allowing my custom
;; one in keys.el to be used instead
(add-hook 'python-mode-hook
  (lambda ()
    (local-unset-key (kbd "<backtab>"))))

(provide 'misc.el)
;;; misc.el ends here
