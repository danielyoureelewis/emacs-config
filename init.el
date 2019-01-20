;; Dan's init
;; Author: Daniel Lewis github.com/danielyoureelewis

;; load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (nimbus)))
 '(custom-safe-themes
   (quote
    ("71a09a8e06310e2616897b4f438f32d6c3dfbb1fde13518c13c37b53f82c4087" default)))
 '(electric-pair-mode t)
 '(enwc-wired-device "enp0s25")
 '(enwc-wireless-device (quote wlp3s0))
 '(package-selected-packages
   (quote
    (enwc el-get use-package-el-get org-bullets use-package yasnippet-snippets slime paredit elpy cider web-mode w3m tramp-term terminal-here shrink-path ranger racket-mode quelpa-use-package popup-kill-ring podcaster org-evil nimbus-theme material-theme js3-mode js2-mode geiser flymake-jslint flymake-jshint flymake-gjshint flycheck exwm-surf exec-path-from-shell eslint-fix emms elfeed eldoc-eval dired-ranger better-defaults all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
