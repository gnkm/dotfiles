;;; 20_utilities.el --- utilities configurations

;;; Commentary:
;; loads utilities

;;; Code:

;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert-templates/")

;; ddskk
(use-package skk
  :config
  (global-set-key "\C-x\C-j" 'skk-mode)
  (setq skk-use-azik t)
  (setq skk-tut-file "~/Documents/ddskk/SKK.tut"))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; smartparens
(use-package smartparens
  :config
  (smartparens-global-mode t))

;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode t))

;; yasnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/my-snippets"))
  (yas-global-mode 1))

(put 'narrow-to-region 'disabled nil)
;; startup profiler
(eval-after-load 'esup
  '(progn
     (use-package esup)))

;;; 20_utilities.el ends here
