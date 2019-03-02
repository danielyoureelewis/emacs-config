(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin/"))
(setq exec-path (append exec-path '("~/.local/bin/")))

(require 'package)

;;using melpa as repo
(setq package-archives
  `(,@package-archives
     ("melpa" . "https://melpa.org/packages/")
     ;; ("marmalade" . "https://marmalade-repo.org/packages/")
     ("org" . "https://orgmode.org/elpa/")
     ;; ("user42" . "https://download.tuxfamily.org/user42/elpa/packages/")
     ;; ("emacswiki" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/emacswiki/")
     ;; ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")
  ))

;;activate the packages
(package-initialize)

;;fetch list of packages availiable
(unless package-archive-contents
  (package-refresh-contents))

(defvar package-list '(all-the-icons 
                       better-defaults 
		                   dired-ranger 
		                   dired-hacks-utils 
            		       eldoc-eval 
		                   elfeed 
            		       emms 
		                   enwc 
		                   eslint-fix 
		                   exec-path-from-shell 
		                   exwm-surf 
	            	       exwm
                       el-get
                       use-package-el-get
                       flycheck 
		                   flymake-gjshint 
		                   flymake-jshint 
		                   flymake-jslint 
		                   flymake-easy 
              	       geiser 
            		       js2-mode 
		                   js3-mode 
                       material-theme 
                       memoize 
                       nimbus-theme 
                       org-evil 
                       org 
                       monitor 
                       evil 
                       goto-chg 
                       podcaster 
                       popup-kill-ring 
                       popup 
                       pos-tip 
                       quelpa-use-package 
                       quelpa 
                       racket-mode 
                       faceup 
                       ranger 
                       shrink-path 
                       f 
                       dash 
                       terminal-here 
                       tramp-term 
                       undo-tree 
                       use-package 
                       bind-key 
                       w3m 
                       web-mode 
                       xelb 
                       cider 
                       clojure-mode 
                       elpy 
                       company 
                       find-file-in-project 
                       highlight-indentation 
                       ivy 
                       paredit 
                       pkg-info 
                       epl 
                       pyvenv 
                       queue 
                       s 
                       sesman 
                       slime 
                       spinner 
                       yasnippet-snippets 
                       yasnippet))

(package-install 'use-package)
(require 'use-package)

(require 'use-package-el-get)
(setq use-package-always-ensure nil)
(use-package-el-get-setup)

(use-package exwm
  :ensure t
  :config
  (require 'exwm-config)
  (exwm-config-default))

(global-linum-mode t)

(load "~/.local/bin/org-bullets")
(require 'org-bullets)
(setq org-bullets-bullet-list '("☯" "○" "✸" "✿" "~"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'color)
(set-face-attribute 'org-block nil :background
                    (color-darken-name
                     (face-attribute 'default :background) 3))

(setq org-todo-keywords
 '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

(setq org-todo-keyword-faces
 '(("IN-PROGRESS" . "orange") 
   ("WAITING" . "magenta") 
   ("CANCELED" . "red") 
   ("DONE" . "green")))

(require 'nimbus-theme)
(load-theme 'nimbus t)

(defvar foxdot-cli-path "/home/daniel/.local/lib/python3.5/site-packages/")

(add-to-list 'load-path "~/.emacs.d/lisp")
(load (expand-file-name "~/quicklisp/slime-helper.el")) 
(setq inferior-lisp-program "sbcl")

(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((python . t)
    (C . t)
    (css . t)
    (haskell . t)
    (js . t)
    (latex . t)
    (lisp . t)
    (makefile . t)
    (matlab . t)
    (perl . t)
    (picolisp . t)
    (ruby . t)
    (scheme . t)
    (sed . t)
    (shell . t)
    (sql . t)
    (emacs-lisp . t)))

(defvar myPackages
  '(better-defaults
	elpy ;; add elpy
	nimbus-theme))

(setq default-tab-width 4)
(setq-default c-basic-offset 4)
(require 'flymake-gjshint)
  (add-hook 'js-mode-hook 'flymake-gjshint:load)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(require 'w3m-search)
(setq w3m-search-default-engine "duckduckgo")

(setq visible-bell 1)
(column-number-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode 1)
(display-time-mode 1)
(display-battery-mode 1)

(when (boundp 'window-divider-mode)
  (setq window-divider-default-places t
        window-divider-default-bottom-width 0
        window-divider-default-right-width 1)
  (window-divider-mode +1))

(setq enwc-default-backend 'nm)

(setq electric-pair-pairs '(
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\{ . ?\})))
(electric-pair-mode t)

(show-paren-mode 1)
(setq show-paren-style 'expression)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo " file)))
    (find-file file)))
;; or some other keybinding...
(global-set-key (kbd "C-x F") 'djcb-find-file-as-root)

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-beginning-position 2)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(defun halve-other-window-height ()
  "Expand current window to use half of the other window's lines."
  (interactive)
  (enlarge-window (/ (window-height (next-window)) 2)))

(global-set-key (kbd "C-c v") 'halve-other-window-height)

(global-set-key (kbd "C-c c") 'next-buffer)
(global-set-key (kbd "C-c x") 'previous-buffer)

(defun play-youtube-video(url)
(interactive "sURL: ")
(shell-command
  (concat "cvlc " url)))


(defun w3m-play-youtube-video ()
(interactive)
  (play-youtube-video
  (w3m-print-this-url (point))))
(global-set-key (kbd "<f9> y") 'w3m-play-youtube-video)
