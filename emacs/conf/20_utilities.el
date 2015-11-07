;; C-k で行末の改行文字も削除する
;; (setq kill-whole-line t)

;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert-templates/")

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/my-snippets"))
(yas-global-mode 1)

(put 'narrow-to-region 'disabled nil)
;; startup profiler
(eval-after-load 'esup
  '(progn
     (require 'esup)))
