;;; 70_languages.el --- Language configurations

;;; Commentary:
;; 各種言語の設定

;;; Code:

;; for editing config files
(use-package generic-x)

;; coffee-mode
(use-package coffee-mode
  :config
  (custom-set-variables '(coffee-tab-width 2)))

;; emmet-mode
(use-package emmet-mode
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode))

;; dockerfile
(use-package dockerfile-mode
  :mode "Dockerfile\\'")

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; js
(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (custom-set-variables
   '(js2-basic-offset 2)
   '(js2-bounce-indent-p t)
   ))

;; markdown
(use-package markdown-mode
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

;; php
;; 参考：http://www.emacswiki.org/emacs/PhpMode
(use-package php-mode
  :mode "\\.php$'")

;; python
(define-auto-insert "\\.py" "python-template.py")

;; Shell script
(define-auto-insert "\\.sh" "bash-template.sh")

;; web-mode
;; 参考：http://web-mode.org/
(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2) ; for html
  (setq web-mode-code-indent-offset 4)	 ; for js, PHP etc
  )

;; yatex
(use-package yatex
  :mode ("\\.tex$" . yatex-mode)
  :config
  (setq YaTeX-inhibit-prefix-letter t)
  (setq YaTeX-kanji-code nil)
  (setq tex-command "platex")
  (setq dvi2-command "evince")
  (setq tex-pdfview-command "evince"))

;;; 70_languages.el ends here
