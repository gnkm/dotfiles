;; auto-insert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert-templates/")

;; startup profiler
(eval-after-load 'esup
  '(progn
     (require 'esup)))
