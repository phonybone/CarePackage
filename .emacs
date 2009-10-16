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
  (load "~/.gnu-emacs-custom" t t)
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
(global-set-key "\C-c\t" 'auto-fill-mode)
(set-variable 'scroll-step 0)

(global-set-key [home]   'beginning-of-buffer) ;
(global-set-key [end]    'end-of-buffer) ;

(scroll-bar-mode nil)
(setq make-backup-files nil)
(setq region-face 0)
(global-font-lock-mode 0)

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
(setq load-path
      (nconc
       '(
	 "/Local/Users/victor/Library/OpenUp/jde_2_1_5-2_1_6beta13_orig_0/jde-2.1.6beta13/lisp"
	 )
       load-path))

;(require 'jde)

; Load org-mode:
(setq load-path (cons "/local/software/org-6.23b/lisp" load-path))
(require 'org-install)

;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook 'turn-on-font-lock) 