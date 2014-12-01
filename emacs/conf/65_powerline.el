;; powerline
(require 'powerline)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "DarkOrange1"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#fff"
                    :background "tomato3"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "white"
                    :background "tomato4"
                    :inherit 'mode-line)

(powerline-default-theme)
