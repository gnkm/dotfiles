;;; 20_utilities.el --- utilities configurations

;;; Commentary:
;; loads utilities

;;; Code:

;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory
      (concat user-emacs-directory "insert-templates/"))

(use-package auto-install)

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; smartparens
(use-package smartparens
  :config
  (smartparens-global-mode t))

(use-package rainbow-delimeters)

;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode t))

;; yasnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs
	(concat user-emacs-directory "my-snippets/"))
  (yas-global-mode 1))

(put 'narrow-to-region 'disabled nil)
;; startup profiler
(eval-after-load 'esup
  '(progn
     (use-package esup)))

;;; 20_utilities.el ends here
