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

(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :config
  (add-hook 'js2-mode-hook
          (defun my-js2-mode-setup ()
            (flycheck-mode t)
            (when (executable-find "eslint")
              (flycheck-select-checker 'javascript-eslint))))
  (add-hook 'js2-mode-hook #'add-node-modules-path))

(provide 'packages.el)
;;; packages.el ends here
