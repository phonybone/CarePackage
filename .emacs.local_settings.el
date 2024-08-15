;; victor:  my settings
(global-set-key "\C-xa" 'goto-line)
(global-set-key "\C-xc" 'compile)
;(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key "\C-x?" 'help)
(global-set-key "\C-xg" 'magit-status)
(global-set-key "\C-x%" 'replace-string)
(global-set-key [page-down] 'scroll-down)
(global-set-key [page-up] 'scroll-up)
(global-set-key [M-up] 'beginning-of-buffer)
(global-set-key [M-down] 'end-of-buffer)
(global-set-key [C-right] 'forward-word)
(global-set-key [C-left] 'backward-word)
(global-set-key [M-right] 'forward-word)
(global-set-key [M-left] 'backward-word)
(global-set-key "\C-x'" 'next-error)
(global-set-key "\C-c\t" 'auto-fill-mode)
(global-set-key (kbd "C-:") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)

(set-variable 'scroll-step 0)
(setq inhibit-flash-screen t)
(tool-bar-mode -1)

(menu-bar-mode -1)
(global-display-line-numbers-mode)


(global-set-key [home]   'beginning-of-buffer) 
(global-set-key [end]    'end-of-buffer) 

;; (scroll-bar-mode -1)
(setq make-backup-files nil)
(setq region-face 0)
(global-font-lock-mode 1)
(transient-mark-mode 0)
(setq inhibit-splash-screen t)
(global-auto-revert-mode)

(setq case-fold-search t)

(server-start)
;; (desktop-save-mode nil)

;; Allow bash functions, et al, to work
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Make all *.org under ~/Dropbox/glossary visibile in the *scratch* directory
(setq initial-major-mode 'org-mode)
; (setq initial-scratch-message (shell-command-to-string "org_notes ~/Dropbox/glossary 2>/dev/null"))
(setq org-return-follows-link t)

;; (load-theme 'tango-dark)
(add-to-list 'custom-theme-load-path "/Users/victor/.emacs.d/themes/")
(load-theme 'jazz t)

<<<<<<< HEAD
;; projectile
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
=======
(add-hook 'org-mode-hook 'my/org-mode-hook)

;; open files at startup:
(find-file "~/Dropbox/scratchpad.txt")
>>>>>>> 27c4c5f275262f4da771bb1cf23f91e2636976af
