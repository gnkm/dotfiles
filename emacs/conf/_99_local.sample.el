;;; _99_local.sample.el --- for local settings

;;; Commentary:
;; settigs for individual machines

;;; Code:

;; mew(account data)
(setq mew-imap-user "user-login-name")  ;; (user-login-name)
(setq mew-imap-server "server-name")    ;; if not localhost
(setq mew-imap-auth  t)
(setq mew-imap-ssl t)
(setq mew-imap-ssl-port "*")
(setq mew-smtp-auth t)
(setq mew-smtp-ssl t)
(setq mew-smtp-ssl-port "*")
(setq mew-smtp-user "user-login-name")
(setq mew-smtp-server "server-name")
(setq mew-ssl-cert-directory "/path/to/certs")
(setq mew-ssl-verify-level 0)
(setq mew-use-master-passwd t)

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
