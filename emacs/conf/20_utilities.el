;;; 20_utilities.el --- utilities configurations

;;; Commentary:
;; loads utilities

;;; Code:

;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory
      (concat user-emacs-directory "insert-templates/"))

;; ddskk

(use-package skk
  :config
  (global-set-key "\C-\\" 'skk-mode)
  (setq skk-use-azik t)
  (setq-default skk-kutouten-type 'en)
  (setq skk-tut-file (concat skk-user-directory "SKK.tut"))
  (setq skk-henkan-face (skk-make-face 'grey/DimGray))
  (setq skk-large-jisyo (concat skk-user-directory "dic/SKK-JISYO.L")))

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
	'((concat user-emacs-directory "my-snippets")))
  (yas-global-mode 1))

(put 'narrow-to-region 'disabled nil)
;; startup profiler
(eval-after-load 'esup
  '(progn
     (use-package esup)))

;;; 20_utilities.el ends here
