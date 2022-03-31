;;; cfn-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "cfn-mode" "cfn-mode.el" (0 0 0 0))
;;; Generated autoloads from cfn-mode.el

(autoload 'cfn-mode "cfn-mode" "\
Cloudformation mode derived from `yaml-mode'.

\(fn)" t nil)

(add-to-list 'magic-mode-alist '("\\(---\n\\)?AWSTemplateFormatVersion:" . cfn-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "cfn-mode" '("cfn-")))

;;;***

;;;### (autoloads nil nil ("cfn-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cfn-mode-autoloads.el ends here
