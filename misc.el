(setq tab-width 2) ; Default tab-width
(setq lisp-indent-offset 2) ; Setting the indent level for lisp
(setq inhibit-splash-screen t) ; Disable splash screen
(global-visual-line-mode t) ; Turning on visual line mode
(global-linum-mode t) ; Always show line numbers
(delete-selection-mode 1) ; Deleting selected text if typed in/pasted
(setq make-backup-files nil) ; Preventing backup (~) files
(fset 'yes-or-no-p 'y-or-n-p) ; Use y or n instead of yes or no
(tool-bar-mode -1) ; Hiding toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; Hide scroll bar
(show-paren-mode 1) ; Always show matching parenthesis
