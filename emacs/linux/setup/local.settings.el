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
(global-set-key "\C-cq" 'auto-fill-mode) ;for org-mode, where \C-c\t is already bound
(global-set-key (kbd "C-:") 'comment-or-uncomment-region)
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)

(set-variable 'scroll-step 0)
(setq inhibit-flash-screen t)
(tool-bar-mode -1)
(menu-bar-mode 1)
(global-linum-mode t)


(global-set-key [home]   'beginning-of-buffer) 
(global-set-key [end]    'end-of-buffer) 

(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq region-face 0)
(global-font-lock-mode 1)

(transient-mark-mode 0)
(global-auto-revert-mode)

(setq case-fold-search t)

;; Allow bash functions, et al, to work
(setq shell-file-name "bash")
(setq shell-command-switch "-c")	; was "-ic"; let's see what breaks...

(load-theme 'tango-dark)

;; open files on startup:
(find-file "~/Dropbox/scratchpad.txt")
(find-file "~/Dropbox/bookmarks.org")

;; Don't ask to terminate
;; (require 'auto-answer)    

;; (let ((auto-answer '(("\\`Active processes exist; kill them and exit anyway\\? \\'" t))))
;;   (save-buffers-kill-emacs))

(set-face-attribute 'default nil :font "-PfEd-DejaVu Sans Mono-bold-normal-normal-*-13-*-*-*-m-0-iso10646-1" )


;;========================================
;; Useful these defaults
;;========================================
(use-package emacs
  :init
  ;; <OPTIONAL> Setting my favorite fonts here. You can replace "Roboto" with your favorite font.
  ;; You can also also adjust the size of the font with the "height" here under.
  (set-face-attribute 'default nil :family "Roboto Mono" :height 120 :weight 'regular)
  (set-face-attribute 'fixed-pitch nil :family "Roboto Mono" :height 120 :weight 'medium)
;;  (set-face-attribute 'variable-pitch nil :family "Roboto Regular" :height 120 :weight 'medium)
  :config
  (setq-default cursor-type 'bar)              ; Line-style cursor similar to other text editors
  (setq inhibit-startup-screen t)              ; Disable startup screen (the welcome to Emacs message)
  (setq initial-scratch-message "")	       ; Make *scratch* buffer blank
  (setq-default frame-title-format '("%b"))    ; Make window title the buffer name
  (setq confirm-kill-processes nil)            ; Stop confirming the killing of processes
  (setq use-short-answers t)	               ; y-or-n-p makes answering questions faster
  (show-paren-mode t)	                       ; Visually indicates pair of matching parentheses
  (delete-selection-mode t)                    ; Start writing straight after deletion
  (setq read-process-output-max (* 1024 1024)) ; Increase the amount of data which Emacs reads from the process
)

;; (use-package modus-themes
;;   :ensure t
;;   :config
;;     (setq modus-themes-org-blocks 'gray-background
;; 	modus-themes-fringes 'subtle
;; 	modus-themes-italic-constructs t
;; 	modus-themes-bold-constructs t
;; 	modus-themes-syntax '(alt-syntax)
;; 	modus-themes-hl-line '(intense)
;; 	modus-themes-paren-match '(intense)
;; 	modus-themes-mode-line '(borderless))
;;     (setq modus-themes-headings
;;         (quote ((1 . (background overline variable-pitch 1.4))
;;                 (2 . (overline rainbow variable-pitch 1.25))
;;                 (3 . (overline 1.1))
;;                 (t . (monochrome))))))

