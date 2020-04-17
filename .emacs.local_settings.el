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
(global-set-key (kbd "C-:") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)

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

(server-start)

;; Allow bash functions, et al, to work
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Make all *.org under ~/Dropbox/glossary visibile in the *scratch* directory
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message (shell-command-to-string "org_notes ~/Dropbox/glossary 2>/dev/null"))
(setq org-return-follows-link t)

(load-theme 'tango-dark)
;; fix theme for org-mode font height
(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

(add-hook 'org-mode-hook 'my/org-mode-hook)
