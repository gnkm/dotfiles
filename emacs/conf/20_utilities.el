;;; 20_utilities.el --- utilities configurations

;;; Commentary:
;; loads utilities

;;; Code:

;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert-templates/")

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

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
