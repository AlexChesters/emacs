;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use package
(require 'use-package)

;; Custom filess
(load-file "/Users/chesta02/.emacs.d/init/keys.el") ; Loading key-bindings
