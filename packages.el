;;; packages.el --- Configuration of third-party emacs packages

;;; Commentary:

;;; Code:

;; Ivy
(use-package ivy
  :config
  (ivy-mode)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

;; Flycheck
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'packages.el)
;;; packages.el ends here
