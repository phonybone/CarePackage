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

(setq org-refile-targets '(((concat org-directory "/gtd.org") :maxlevel . 3)
			   ((concat org-directory "/someday.org") :level . 1)
			   ((concat org-directory "/tickler.org") :maxlevel . 2)
			   ))

(global-set-key (kbd "C-c c") 'org-capture)
