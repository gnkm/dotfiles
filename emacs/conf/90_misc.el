;; twittering mode
(autoload 'twit "twittering-mode")
(eval-after-load 'twittering-mode
    '(progn
       (setq twittering-use-master-password t)
       (setq twittering-initial-timeline-spec-string '(":home"))
       (setq twittering-icon-mode t)	; Show icons
       (setq twittering-timer-interval (* 5 60)) ; Update timeline each 5 minutes
))
