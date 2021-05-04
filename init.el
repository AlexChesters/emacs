;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use package
(require 'use-package)

;; Custom files
(load-file "/Users/chesta02/.emacs.d/keys.el") ; Loading key-bindings
(load-file "/Users/chesta02/.emacs.d/misc.el") ; Loading miscellanous configuration
