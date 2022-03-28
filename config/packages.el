;;; packages.el --- Configuration of third-party emacs packages

;;; Commentary:

;;; Code:

;; aggressive-indent
(use-package aggressive-indent
  :config
  (aggressive-indent-mode))

;; all-the-icons
(use-package all-the-icons)

;; anaconda-mode
(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

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

(use-package company-anaconda
  :ensure t
  :init (require 'rx)
  :after (company)
  :config
  (add-to-list 'company-backends 'company-anaconda))

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
(defun my/use-stylelint-from-node-modules ()
  "Search node_modules/ for stylelint executable."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (stylelint
          (and root
               (expand-file-name "node_modules/.bin/stylelint"
                                 root))))
    (when (and stylelint (file-executable-p stylelint))
      (setq-local flycheck-general-stylelint-executable stylelint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(add-hook 'flycheck-mode-hook #'my/use-stylelint-from-node-modules)

;; A workaround for the fact that Flycheck currently doesn't support
;; v14+ of stylelint
;; https://github.com/flycheck/flycheck/issues/1912#issue-1034084913
(flycheck-define-checker general-stylelint
  "A checker for CSS and related languages using Stylelint"
  :command ("stylelint"
            (eval flycheck-stylelint-args)
            (option-flag "--quiet" flycheck-stylelint-quiet)
            (config-file "--config" flycheck-general-stylelintrc))
  :standard-input t
  :error-parser flycheck-parse-stylelint
  :predicate flycheck-buffer-nonempty-p
  :modes (scss-mode))
(flycheck-def-config-file-var flycheck-general-stylelintrc
    (general-stylelint) nil)
(add-to-list 'flycheck-checkers 'general-stylelint)
(add-hook 'scss-mode-hook
          (lambda ()
            (flycheck-disable-checker 'scss-stylelint)))

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

;; racer
(use-package racer
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

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
  ; ensure eslint runs alongside tide
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (setq tide-completion-ignore-case t)
  (setq tide-always-show-documentation t)
  (setq tide-completion-detailed t)
  (setq tide-disable-suggestions t))

(add-hook 'typescript-mode-hook #'setup-tide)
(add-hook 'typescript-mode-hook #'add-node-modules-path)

;; tsx
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

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
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
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
