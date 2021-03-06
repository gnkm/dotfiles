;;; 75_org.el --- for org mode

;;; Commentary:
;; settigs for org mode

;;; Code:

;; org mode
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)" "SUSPENDED(p)")))

;; latex export
(use-package ox-latex)
;; for org < 8
;; http://orgmode.org/worg/org-tutorials/org-latex-export.html
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("jsarticle"
               "\\documentclass[a4paper]{jsarticle}
[NO-DEFAULT-PACKAGES]
\\usepackage{amsmath}
\\usepackage{hyperref}
\\usepackage{graphicx}"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
;; ^, _ の変換を明示的に行う
(setq org-export-with-sub-superscripts '{})

;;; 75_org.el ends here
