;; setup org-capture:
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-agenda-files (list
			(concat org-directory "/inbox.org")
			(concat org-directory "/gtd.org")
			(concat org-directory "/tickler.org")
			))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline (concat org-directory "/inbox.org") "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline (concat org-directory "/tickler.org") "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/Dropbox/org/gtd.org" :maxlevel . 3)
			   ("~/Dropbox/org/someday.org" :level . 1)
			   ("~/Dropbox/org/tickler.org" :maxlevel . 2)))
			   
(setq org-refile-targets '(("~/Dropbox/org/gtd.org" :maxlevel . 3)
			   ("~/Dropbox/org/someday.org" :level . 1)
			   ((concat org-directory "/tickler.org") :maxlevel . 2)))
			   
(concat org-directory "/tickler.org")

(global-set-key (kbd "C-c c") 'org-capture)
