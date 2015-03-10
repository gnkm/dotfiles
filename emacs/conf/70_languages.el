;; Language configurations

;; coffee-mode
(require 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

;; markdown
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Shell script
(define-auto-insert "\\.sh" "bash-template.sh")

;; yatex
(when (locate-library "yatex")
  (add-to-list 'auto-mode-alist '("\\.tex$" . yatex-mode))
  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
  (setq YaTeX-inhibit-prefix-letter t)
  (setq YaTeX-kanji-code nil)
  (setq tex-command "platex")
  (setq dvi2-command "evince")
  (setq tex-pdfview-command "evince"))
