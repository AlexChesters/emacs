;;; packages.el --- Configuration of third-party emacs packages

;;; Commentary:

;;; Code:

;; aggressive-indent
(use-package aggressive-indent
  :config
  (aggressive-indent-mode))

;; company
(use-package company
  :config
  (global-company-mode))

;; drag-stuff
(use-package drag-stuff
  :config
  (drag-stuff-mode t))

;; diff-hl
(use-package diff-hl
  :config
  (global-diff-hl-mode))

;; dtrt-indent
(add-to-list 'load-path "~/.emacs.d/packages/dtrt-indent/")
(require 'dtrt-indent)
(dtrt-indent-global-mode)

;; elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

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

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; magit
(use-package magit
  :config
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))

;; Projectile
(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-switch-project-action 'projectile-dired))

;; shell-pop
(use-package shell-pop
  :config
  (setq shell-pop-window-size 20))

;; smartparens
(use-package smartparens
  :config
  (smartparens-global-mode)
  (sp-local-pair '(emacs-lisp-mode text-mode) "'" nil :actions nil)) ; Prevent automatically inserting a second single quotes in some modes

;; spaceline
(use-package spaceline
  :config
  (spaceline-spacemacs-theme))

;; tide
(defun setup-tide ()
  "Function to set up tide mode."
  (interactive)
  (tide-setup)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(add-hook 'typescript-mode-hook #'setup-tide)

;; yaml-mode
(use-package yaml-mode
  :mode ("\\.ya?ml$" . yaml-mode))

(provide 'packages.el)
;;; packages.el ends here
