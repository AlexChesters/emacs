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
(load-file "~/.emacs.d/config/functions.el") ; Loading custom functions
(load-file "~/.emacs.d/config/keys.el") ; Loading key-bindings
(load-file "~/.emacs.d/config/misc.el") ; Loading miscellanous configuration
(load-file "~/.emacs.d/config/packages.el") ; Loading packages
(load-file "~/.emacs.d/config/appearance.el") ; Loading appearance configuration

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(custom-safe-themes
     '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
  '(package-selected-packages
     '(git-timemachine move-text restart-emacs web-mode rainbow-delimiters flycheck-popup-tip elpy smartparens helm-swoop company spaceline apropospriate-theme ample-theme diff-hl markdown-mode tide helm-ag helm xah-elisp-mode xwwp-follow-link-helm spacemacs-theme drag-stuff aggressive-indent shell-pop yaml-mode melancholy-theme exec-path-from-shell add-node-modules-path js2-mode flycheck powerline use-package projectile neotree magit))
 '(projectile-completion-system 'helm)
 '(shell-pop-window-size 15))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init.el)
;;; init.el ends here
