(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
		      starter-kit-bindings
		      starter-kit-js
		      autopair
		      yasnippet
		      auto-complete
		      fuzzy
                      php-mode
                      php-extras
                      )
  "Packages to be installed at launch.")

;; Install if not yet installed
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(autopair-global-mode)
(yas-global-mode 1)

(require 'auto-complete-config)
(setq ac-dictionary-files (list (concat user-emacs-directory ".dict")))
(ac-config-default)

;; Fixes pycomplete.el
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq ac-sources '(ac-source-pycomplete
				ac-source-abbrev
				ac-source-dictionary
				ac-source-words-in-same-mode-buffers))))

;; Set up python-mode
(setq py-install-directory (concat esk-user-dir "/python-mode.el-6.0.12/"))
(add-to-list 'load-path py-install-directory)

;; shows method signatures in python
(setq py-set-complete-keymap-p t)
