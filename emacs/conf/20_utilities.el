;; helm
(require 'helm-config)
(helm-mode 1)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert-templates/")
