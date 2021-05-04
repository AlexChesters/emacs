;; Ivy
(use-package ivy
  :config
  (ivy-mode)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

;; Projectile
(use-package projectile
  :config
  (projectile-mode))
