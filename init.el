;;; init.el --- My custom emacs configuration

;;; Commentary:

;;; Code:

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use package
(require 'use-package)

;; ensure flycheck is aware of melpa packages
;; this must come before packages are loaded
(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; Custom files
(load-file "~/.emacs.d/config/appearance.el") ; Loading appearance configuration
(load-file "~/.emacs.d/config/functions.el") ; Loading custom functions
(load-file "~/.emacs.d/config/keys.el") ; Loading key-bindings
(load-file "~/.emacs.d/config/misc.el") ; Loading miscellanous configuration
(load-file "~/.emacs.d/config/packages.el") ; Loading packages

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(custom-safe-themes
     '("f4c8f0b999a6407211a899401315a628e1a5ae2f408c04a33b14d7aa3ed86187" "f6d8afd9d1ad09b54de40e950763424d7be889ef7de3c4043336b228d1fde1c2" "bdc18d7f41451d56fb89348649647ff5b8475f33e8973ec2a3190460eed9941c" "3f4d45d3f0011390fa934ce3bb5f786c134e56c738226f9163dbf434ff60c20a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
  '(package-selected-packages
     '(flycheck-rust rust-mode csv-mode dockerfile-mode apache-mode gitignore-mode prettier eglot json-mode all-the-icons ace-jump-mode whitespace-cleanup-mode vscdark-theme vs-dark-theme sunny-day-theme silkworm-theme treemacs writeroom-mode vue-mode git-timemachine move-text restart-emacs web-mode rainbow-delimiters flycheck-popup-tip smartparens helm-swoop company spaceline apropospriate-theme ample-theme diff-hl markdown-mode tide helm-ag helm xah-elisp-mode xwwp-follow-link-helm spacemacs-theme drag-stuff aggressive-indent shell-pop yaml-mode melancholy-theme exec-path-from-shell add-node-modules-path js2-mode flycheck powerline use-package projectile neotree magit))
 '(projectile-completion-system 'helm)
 '(shell-pop-window-size 15)
 '(vue-html-tab-width 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init.el)
;;; init.el ends here
