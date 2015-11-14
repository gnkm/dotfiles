;;; 90_misc.el --- miscellaneous configurations

;;; Commentary:
;; miscellaneous configurations

;;; Code:

;; eww
(setq eww-search-prefix "https://www.google.co.jp/search?q=")

;; ;; twittering mode
(use-package twittering-mode
  :commands (twit)
  :config
  (setq twittering-use-master-password t)
  (setq twittering-initial-timeline-spec-string '(":home"))
  (setq twittering-icon-mode t)	; Show icons
  (setq twittering-timer-interval (* 5 60)) ; Update timeline each 5 minutes
  )

;;; 90_misc.el ends here
