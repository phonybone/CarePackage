;; setup org-capture:
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-agenda-files (list
			(concat org-directory "/inbox.org")
			(concat org-directory "/gtd.org")
			(concat org-directory "/tickler.org")
			))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Dropbox/org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Dropbox/org/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(
			   ("~/Dropbox/org/gtd.org" :maxlevel . 3)
			   ("~/Dropbox/org/someday.org" :maxlevel . 1)
			   ("~/Dropbox/org/tickler.org" :maxlevel . 2)))


;; (setq org-refile-targets (list
;; 			  (list (concat org-directory "/gtd.org") :maxlevel . 3)
;; 			  (list (concat org-directory "/someday.org") :level . 1)
;; 			  (list (concat org-directory "/tickler.org") :maxlevel . 2)
;; 			  ))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; Make all *.org under ~/Dropbox/glossary visibile in the *scratch* directory
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message (shell-command-to-string "org_notes ~/git-repos/glossary 2>/dev/null"))
(setq org-return-follows-link t)

;; fix theme for org-mode font height
;; https://emacs.stackexchange.com/questions/22584/disable-enlarged-org-mode-header-appearance
(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

;; (add-hook 'org-mode-hook 'my/org-mode-hook)
