;; This depends on package having already been initialized, which currently happens in ~/.emacs

(require 'python)
;;(require 'ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

;; Elpy:
(when (require 'elpy nil t)
  (elpy-enable)
  (pyvenv-activate "~/.virtualenvs/emacs")
  (setq python-check-command "~/.virtualenvs/emacs/bin/flake8")
  )



(setq python-shell-interpreter-args "--simple-prompt -i")
;; see https://github.com/jorgenschaefer/elpy/issues/1106, comment by RobinTourneme

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((python . t)))
