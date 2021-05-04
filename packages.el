;; Ivy
(use-package ivy
  :config
  (ivy-mode)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

;; Flycheck
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
