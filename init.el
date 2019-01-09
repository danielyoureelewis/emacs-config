;; Dan's init
;; Author: Daniel Lewis github.com/danielyoureelewis

;; load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(case-fold-search nil)
 '(custom-enabled-themes (quote (nimbus)))
 '(custom-safe-themes
   (quote
    ("71a09a8e06310e2616897b4f438f32d6c3dfbb1fde13518c13c37b53f82c4087" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(elpy-rpc-python-command "python3" t)
 '(enwc-wired-device "enp0s25")
 '(enwc-wireless-device "wlp3s0")
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(menu-bar-mode t)
 '(package-selected-packages
   (quote
    (popup-kill-ring nimbus-theme doom-modeline use-package enwc podcaster emms w3m exwm-surf flymake-gjshint flycheck flymake-jshint terminal-here exec-path-from-shell js2-mode web-mode eslint-fix flymake-jslint js3-mode tramp-term geiser racket-mode org-evil org dired-ranger evil yasnippet-snippets slime paredit elpy cider ranger material-theme elfeed better-defaults)))
 '(python-shell-interpreter "/usr/bin/python3")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
