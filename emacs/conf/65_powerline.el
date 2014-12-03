;; powerline
(require 'powerline)

(set-face-attribute 'mode-line nil
                    :foreground "white"
                    :background "dark orange" ; #ff8c00
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "white"
                    :background "DarkOrange4" ; #8b4500
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "white"
                    :background "gray19" ; #303030
                    :inherit 'mode-line)

(powerline-default-theme)
