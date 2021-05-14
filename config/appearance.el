;;; appearance.el --- Appearance configuration

;;; Commentary:

;;; Code:

(set-frame-font "Fira Code 16")
(load-theme 'apropospriate-dark t)
(setq display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'markdown-mode-hook 'display-fill-column-indicator-mode)
;; https://github.com/AdamNiederer/vue-mode/issues/112
(add-hook 'vue-mode-hook 'display-fill-column-indicator-mode)

(provide 'appearance.el)
;;; appearance.el ends here
