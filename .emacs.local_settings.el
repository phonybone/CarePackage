;; victor:  my settings
(global-set-key "\C-xa" 'goto-line)
(global-set-key "\C-xc" 'compile)
;(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key "\C-x?" 'help)
(global-set-key "\C-x%" 'replace-string)
(global-set-key [page-down] 'scroll-down)
(global-set-key [page-up] 'scroll-up)
(global-set-key [M-up] 'beginning-of-buffer)
(global-set-key [M-down] 'end-of-buffer)
(global-set-key "\C-x'" 'next-error)
(global-set-key "\C-c\t" 'auto-fill-mode)
(global-set-key (kbd "C-:") 'comment-region)
(set-variable 'scroll-step 0)
(setq inhibit-flash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)


(global-set-key [home]   'beginning-of-buffer) 
(global-set-key [end]    'end-of-buffer) 

(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq region-face 0)
(global-font-lock-mode 1)

(transient-mark-mode 0)
(setq inhibit-splash-screen t)
(global-auto-revert-mode)

(setq case-fold-search t)
