;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(package-initialize)
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://melpa.org/packages/")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;; ---------------------
;;;
;;; Note: This file switches between two Emacs versions:
;;;            GNU-Emacs (19.34/20.X) and X-Emacs (19.14/20.X).
;;;       Please to not mix both versions: GNU-Emacs and X-Emacs
;;;       are incompatible. They use differnet binary code for
;;;       compiled lisp files and they have different builtin
;;;       lisp functions ... not only names of such functions
;;;       are different!!!
;;;
;;; If you need your own personal ~/.emacs
;;; please make a copy of this file
;;; an placein your changes and/or extension.
;;;
;;; Copyright (c) 1997 S.u.S.E. Gmbh Fuerth, Germany.  All rights reserved.
;;;
;;; Author: Werner Fink, <werner@suse.de> 1997,98,99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Test of Emacs derivates
;;; -----------------------
(if (string-match "XEmacs\\|Lucid" emacs-version)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; XEmacs
  ;;; ------
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (progn
      ;;
      ;; If not exists create the XEmacs options file
      ;; --------------------------------------------
      (if (and (not (file-readable-p "~/.xemacs-options"))
	       (fboundp 'save-options-menu-settings))
	(save-options-menu-settings))
      ;;
      ;; Remember font and more settings
      ;; -------------------------------
      (setq options-save-faces t)
      ;;
      ;; AUC-TeX
      ;; -------
      (if  (or (file-accessible-directory-p
	        "/usr/X11R6/lib/xemacs/site-lisp/auctex/")
       		(or (and (= emacs-major-version 19)
			 (>= emacs-minor-version 15))
           	    (= emacs-major-version 20)))
       (progn
	   (require 'tex-site)
	   (setq-default TeX-master nil)
	   ; Users private libaries 
	   ; (setq TeX-macro-private '("~/lib/tex-lib/"))
	   ;    AUC-TeX-Macros
	   ; (setq TeX-style-private   "~/lib/xemacs/site-lisp/auctex/style/")
	   ;    Autom. Auc-TeX-Macros
	   ; (setq TeX-auto-private    "~/lib/xemacs/site-lisp/auctex/auto/")
	))
  )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; GNU-Emacs
  ;;; ---------
  ;;; load ~/.gnu-emacs or, if not exists /etc/skel/.gnu-emacs
  ;;; For a description and the settings see /etc/skel/.gnu-emacs
  ;;;   ... for your private ~/.gnu-emacs your are on your one.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (file-readable-p "~/.gnu-emacs")
      (load "~/.gnu-emacs" nil t)
    (if (file-readable-p "/etc/skel/.gnu-emacs")
	(load "/etc/skel/.gnu-emacs" nil t)))

  ;; Custum Settings
  ;; ===============
  ;; To avoid any trouble with the customization system of GNU emacs
  ;; we set the default file ~/.gnu-emacs-custom
  (setq custom-file "~/.gnu-emacs-custom")
;;  (load "~/.gnu-emacs-custom" t t)
;;;
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; XEmacs load options
;;; -------------------
;;; If missing the next few lines they will be append automatically
;;; by xemacs. This will be done by `save-options-menu-settings'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Custum Settings
;; ===============
;; Set custom-file to ~/.xemacs-custom for XEmacs to avoid overlap with the
;; custom interface of GNU-Emacs. Nevertheless, in most cases GNU-Emacs can
;; not handle unknown functions in ~/.emacs .. therefore ~/.xemacs-custom.
(cond
 ((string-match "XEmacs" emacs-version)
	(setq custom-file "~/.xemacs-custom")
	(load "~/.xemacs-custom" t t)))
;; ======================
;; End of Custum Settings

;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
            (= emacs-major-version 19)
            (>= emacs-minor-version 14))
           (= emacs-major-version 20))
       (fboundp 'load-options-file))
  (load-options-file "~/.xemacs-options")))
;; ============================
;; End of Options Menu Settings

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

(add-to-list 'default-frame-alist
	     '(font . "-unknown-Ubuntu Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(fset 'remove-got-heres
   "\C-swarn \"got here\C-a\C-k\C-k")
(global-set-key "\C-x!"    'remove-got-heres) ;

(global-set-key [home]   'beginning-of-buffer) 
(global-set-key [end]    'end-of-buffer) 

(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq region-face 0)
(global-font-lock-mode 1)

;; attempt to load javascript mode:
(autoload 'javascript-mode
     "/usr/share/emacs/20.6/site-lisp/term/javascript-cust"
     "javascript mode" t nil)    

(setq auto-mode-alist
         (append '(("\\.js$" . javascript-mode))
                  auto-mode-alist))

;; php mode:
(defun php-mode-hook ()
  (setq tab-width 4
        c-basic-offset 4
        c-hanging-comment-ender-p nil
  indent-tabs-mode
(not
 (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
      (string-match "\.php$" (buffer-file-name))))))

(setq auto-mode-alist
         (append '(("\\.php$" . php-mode))
                  auto-mode-alist))




;(setq default-major-mode 'Text-mode)

; Attempt to load JDE stuff:
;; (setq load-path
;;       (nconc
;;        '(
;; 	 "/Local/Users/victor/Library/OpenUp/jde_2_1_5-2_1_6beta13_orig_0/jde-2.1.6beta13/lisp"
;; 	 )
;;        load-path))

;(require 'jde)

;; load personal macros (needs a check for the existance of the file)
;;(load '.emacs-macros)

;; Make searches case-insensitive
(setq case-fold-search t)

;; ------------------------------------------------------------------------
;; SES (Simple SpreadSheets)
;; ------------------------------------------------------------------------
(add-to-list 'load-path "~/Dropbox/sandbox/emacs")
(autoload 'ses-mode "ses/ses.el" "Spreadsheet mode" t)
(add-to-list 'auto-mode-alist '("\\.ses$" . ses-mode))



;; -----------------------------------------------------------------------------
;; Git support: automatically supported in emacs 23.0
;; -----------------------------------------------------------------------------
;;(load "/usr/share/doc/git-1.7.1/contrib/emacs/git.el")
;;(load "/usr/share/doc/git-1.7.1/contrib/emacs/git-blame.el")
;;(load "/usr/share/emacs/23.1/lisp/vc-git.elc")
(add-to-list 'vc-handled-backends 'GIT)


;; magit:
;; need emacs 24 for (require), etc
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milbox.net/packages") t)

;; perl stuff
(fset 'perl-moose-insert-has
   [?h ?a ?s ?  ?\' ?\' ?  ?= ?> ?\S-  ?\( ?i ?s ?= ?> ?\' ?r ?w ?\' ?, ?  ?i ?s ?a ?= ?> ?\' ?S ?t ?r ?\' ?\) ?\; ?\C-a right right right right right])
(add-hook 'perl-mode-hook '(lambda() (local-set-key "\C-ch" 'perl-moose-insert-has)))

;; python stuff
(require 'python)
;;(require 'ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(fset 'python-insert-warn
   "\C-iwarn(\"\" % ())\C-r\"\C-m")
(add-hook 'python-mode-hook '(lambda() (local-set-key "\C-cw" 'python-insert-warn)))
(load-file "/home/victor/Dropbox/sandbox/lisp/emacs/python.el")

(transient-mark-mode 0)
(setq inhibit-splash-screen t)

;; Whenever a file changes on disk, update it's buffer.  Handy when you
;; do a git checkout <branch>
(global-auto-revert-mode)

;; google-this:
(require 'google-this)
(google-this-mode 1)

(require 'cedet)
;; (semantic-load-enable-minimum-features) ;; or enable more if you wish
;; (require 'malabar-mode)
;; (setq malabar-groovy-lib-dir "/path/to/malabar/lib")
;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))


;; Add error detection for maven errors, so C-x ` works as expected (we hope)
;(add-to-list 'compilation-error-regexp-alist 'maven)
;(add-to-list 'compilation-error-regexp-alist-alist
;       '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
;           1 2 3))

;; see http://stackoverflow.com/questions/2429603/add-keyboard-binding-to-existing-emacs-mode
;; for info about binding keys to macros.

;;(add-to-list 'default-frame-alist '(font . "Input Mono Bold-12" ))

(setq python-shell-interpreter "/home/victor/.virtualenvs/gui_service/bin/ipython"
      python-shell-interpreter-args "-i")

;; Save a macro to .emacs (this file!)
;; Note: this appends to the end of this file, so manually appending
(defun save-macro (name)                  
    "save a macro. Take a name as argument
     and save the last defined macro under 
     this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro    
     (kmacro-name-last-macro name)         ; use this name for the macro    
     (find-file user-init-file)            ; open ~/.emacs or other user init file 
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro 
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer
(fset 'python-insert-main
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([105 102 32 95 95 110 97 109 101 95 95 61 61 45 backspace 39 95 95 109 97 105 110 95 95 39 58 return tab 115 121 115 46 101 120 105 116 40 109 97 105 110 40 41 41 return] 0 "%d")) arg)))
(add-hook 'python-mode-hook '(lambda() (local-set-key "\C-cm" 'python-insert-main)))


(fset 'python-insert-print-dict
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([M-backspace 15 tab 102 111 114 32 107 44 118 32 105 110 32 25 46 105 116 101 109 115 40 41 58 return tab 112 114 105 110 116 32 39 25 91 37 115 93 58 32 37 115 39 32 37 32 40 107 44 118 41] 0 "%d")) arg)))

