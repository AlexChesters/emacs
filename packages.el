;;; packages.el --- Configuration of third-party emacs packages

;;; Commentary:

;;; Code:

;; aggressive-indent
(use-package aggressive-indent
  :config
  (aggressive-indent-mode))

;; drag-stuff
(use-package drag-stuff
  :config
  (drag-stuff-mode t))

;; dtrt-indent
(add-to-list 'load-path "~/.emacs.d/packages/dtrt-indent/")
(require 'dtrt-indent)
(dtrt-indent-global-mode)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; flycheck
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; helm
(use-package helm
  :config
  (helm-mode 1))

;; Js2-mode
(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :config
  (add-hook 'js2-mode-hook
    (defun my-js2-mode-setup ()
      (flycheck-mode t)
      (when (executable-find "eslint")
        (flycheck-select-checker 'javascript-eslint))))
  (add-hook 'js2-mode-hook #'add-node-modules-path)
  (js2-mode-hide-warnings-and-errors))

;; Projectile
(use-package projectile
  :config
  (projectile-mode))

;; shell-pop
(use-package shell-pop
  :config
  (setq shell-pop-window-size 20))

;; yaml-mode
(use-package yaml-mode
  :mode ("\\.ya?ml$" . yaml-mode))

(provide 'packages.el)
;;; packages.el ends here
