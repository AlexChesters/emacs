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
(add-to-list 'load-path "/Users/chesta02/.emacs.d/packages/dtrt-indent/")
(require 'dtrt-indent)
(dtrt-indent-global-mode)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; ivy
(use-package ivy
  :config
  (ivy-mode)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

;; flycheck
(use-package flycheck
  :config
  (setq flycheck-emacs-lisp-load-path "inherit")
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; Flex
(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))

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

;; shell-pop
(use-package shell-pop
  :config
  (setq shell-pop-window-size 20))

;; yaml-mode
(use-package yaml-mode
  :mode ("\\.ya?ml$" . yaml-mode))

(provide 'packages.el)
;;; packages.el ends here
