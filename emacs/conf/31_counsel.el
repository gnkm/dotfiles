;;; 31_counsel.el --- counsel configrations

;;; Commentary:
;; counsel configurations

;;; Code:


(use-package ivy
  :bind(
	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file)
	)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 30) ;; minibufferのサイズを拡大
  (setq ivy-extra-directories nil)
  (setq ivy-re-builders-alist
	'((t . ivy--regex-plus)))
  )

(global-set-key "\C-s" 'swiper)
(setq swiper-include-line-number-in-search t) ;; line-numberでも検索可能

;;; 31_counsel.el ends here
