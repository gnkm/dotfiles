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
