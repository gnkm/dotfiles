;;; _99_local.sample.el --- for local settings

;;; Commentary:
;; settigs for individual machines

;;; Code:

;; org mode
(setq org-agenda-files
      '("~/dropbox/org/inbox.txt"))

(setq org-capture-templates
             '(("i" "Inbox" plain (file "~/dropbox/org/inbox.txt")
		"** %? %U")))

;;; _99_local.sample.el ends here
