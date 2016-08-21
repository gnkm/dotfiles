;;; windows-70_languages.el --- language config for nt-emacs

;;; Commentary:
;; appearances for nt-emacs

;;; Code:

;; plantuml mode
(use-package plantuml-mode
  :mode "\\.puml\\"
  :config
  (setq plantuml-jar-path "/c/Program\ Files/PlantUML/plantuml.jar"))

;;; windows-70_languages.el ends here
