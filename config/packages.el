;;; packages.el --- Configuration of third-party emacs packages

;;; Commentary:

;;; Code:

;; aggressive-indent
(use-package aggressive-indent
  :config
  (aggressive-indent-mode))

;; all-the-icons
(use-package all-the-icons)

;; apache-mode
(use-package apache-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.conf\\'" . apache-mode))
  (add-hook 'apache-mode-hook
    (lambda ()
      (message "apache!")
      (setq tab-width 4))))

;; company
(use-package company
  :config
  (global-company-mode)
  (add-hook 'markdown-mode-hook (company-mode -1)))

;; csv-mode
(use-package csv-mode)

;; drag-stuff
(use-package drag-stuff
  :config
  (drag-stuff-mode t))

;; diff-hl
(use-package diff-hl
  :config
  (global-diff-hl-mode))

;; dockerfile-mode
(use-package dockerfile-mode)

;; dtrt-indent
(add-to-list 'load-path "~/.emacs.d/packages/dtrt-indent/")
(require 'dtrt-indent)
(dtrt-indent-global-mode)

;; eglot
(use-package eglot
  :config
  (add-hook 'js2-mode-hook 'eglot-ensure))

;; exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; flycheck
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
(defun my/use-eslint-from-node-modules ()
  "Search node_modules/ for eslint executable [https://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable]."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; git-timemachine
(use-package git-timemachine)

;; gitignore-mode
(use-package gitignore-mode)

;; helm
(use-package helm
  :config
  (helm-mode 1))

;; Js2-mode
(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :config
  (add-hook 'js2-mode-hook #'select-flycheck-eslint-if-eslint-exists-locally)
  (add-hook 'js2-mode-hook #'add-node-modules-path)
  (add-hook 'js2-mode-hook #'maybe-enable-prettier)
  (js2-mode-hide-warnings-and-errors))

;; json-mode
(use-package json-mode)

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

;; move-text
(use-package move-text)

;; neotree
(use-package neotree
  :config
  (setq neo-autorefresh t))

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))

;; prettier
(use-package prettier
  :config
  (add-hook 'prettier-mode-hook (setq flycheck-disabled-checkers '(javascript-eslint))))

;; Projectile
(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-indexing-method 'alien))

;; rainbow-delemiters-mode
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; rust-mode
(use-package rust-mode
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

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
  (company-mode +1)
  (setq tide-completion-ignore-case t))

(add-hook 'typescript-mode-hook #'setup-tide)
;; (add-hook 'typescript-mode-hook #'select-flycheck-eslint-if-eslint-exists-locally)
(add-hook 'typescript-mode-hook #'add-node-modules-path)

;; treemacs
(use-package treemacs
  :config
  (treemacs)
  (define-key treemacs-mode-map [mouse-1] 'treemacs-single-click-expand-action)
  (setq treemacs-show-hidden-files t)
  (setq treemacs-width 50)
  (setq treemacs-no-png-images t)
  (setq treemacs-git-mode nil))

;; vue-mode
(use-package vue-mode)
(set-face-background 'mmm-default-submode-face nil)
(setq js-indent-level 2)

;; web-mode
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))

;; whitespace-cleanup-mode
(use-package whitespace-cleanup-mode
  :config
  (whitespace-cleanup-mode))

;; writeroom-mode
(use-package writeroom-mode
  :config
  (add-hook 'markdown-mode-hook 'writeroom-mode))

;; yaml-mode
(use-package yaml-mode
  :mode ("\\.ya?ml$" . yaml-mode))

(provide 'packages.el)
;;; packages.el ends here
