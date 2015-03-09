;; Tex
(require 'ox-latex)
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
