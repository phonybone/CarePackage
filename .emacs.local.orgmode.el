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

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
