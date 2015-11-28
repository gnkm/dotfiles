;;; _99_local.sample.el --- for local settings

;;; Commentary:
;; settigs for individual machines

;;; Code:

;; org mode
(setq org-agenda-files
      '("~/dropbox/org/inbox.txt"))

(setq org-refile-targets
      (quote ((nil :maxlevel . 9)
	      (org-agenda-files :maxlevel . 2))))

(setq org-capture-templates
             '(("i" "Inbox" plain (file "~/dropbox/org/inbox.txt")
		"** %? %U")))

(setq org-archive-location
      (concat
       (format-time-string "~/dropbox/org/archives/%Y-%W-archive.txt")
       "::* From %s"))

;;; _99_local.sample.el ends here
