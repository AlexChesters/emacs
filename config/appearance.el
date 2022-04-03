;;; appearance.el --- Appearance configuration

;;; Commentary:

;;; Code:

(set-frame-font "Fira Code 16")
(load-theme 'spacegray t)
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'markdown-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(setq inhibit-splash-screen t) ; Disable splash screen
(global-visual-line-mode t) ; Turning on visual line mode
(tool-bar-mode -1) ; Hiding toolbar
(toggle-frame-maximized) ; Ensure emacs starts maximised

;; https://github.com/AdamNiederer/vue-mode/issues/112
(add-hook 'vue-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'vue-mode-hook 'linum-mode)

(provide 'appearance.el)
;;; appearance.el ends here
