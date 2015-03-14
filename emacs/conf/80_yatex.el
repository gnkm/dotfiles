;;; yatex.el --- for yatex settigs

;;; Commentary:
;; 参照:
;; - https://www.yatex.org/info/yatexj.html
;; Note:
;; 上記ページで <prefix>(C-c) * となっているものは
;; <prefix> C-* に読み替えること．

;;; code:

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;;; 80_yatex.el ends here
