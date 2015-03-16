;;; 70_languages.el --- Language configurations

;;; Commentary:
;; 各種言語の設定

;;; Code:

;; coffee-mode
(require 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

;; markdown
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; php
;; 参考：http://www.emacswiki.org/emacs/PhpMode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; python
(define-auto-insert "\\.py" "python-template.py")

;; Shell script
(define-auto-insert "\\.sh" "bash-template.sh")

;; web-mode
;; 参考：http://web-mode.org/
(require 'web-mode)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  ;; indentation
  (setq web-mode-markup-indent-offset 2) ; for html
  (setq web-mode-code-indent-offset 4)	 ; for js, PHP etc
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)



;; yatex
(when (locate-library "yatex")
  (add-to-list 'auto-mode-alist '("\\.tex$" . yatex-mode))
  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
  (setq YaTeX-inhibit-prefix-letter t)
  (setq YaTeX-kanji-code nil)
  (setq tex-command "platex")
  (setq dvi2-command "evince")
  (setq tex-pdfview-command "evince"))
;;; 70_languages.el ends here
