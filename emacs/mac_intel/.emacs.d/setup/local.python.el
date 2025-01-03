;; This depends on package having already been initialized, which currently happens in ~/.emacs

(require 'python)
;; (require 'ipython)

;; Elpy:
(when (require 'elpy nil t)
  (elpy-enable)
  (pyvenv-activate "~/.pyenv/versions/emacs")
  (setq python-check-command "~/.pyenv/versions/emacs/bin/flake8")

  (setq python-shell-interpreter "/Users/victor/.pyenv/versions/emacs/bin/ipython"
	python-shell-interpreter-args "-i  --simple-prompt")
  (setq elpy-rpc-virtualenv-path "/Users/victor/.pyenv/versions/emacs")
  )
;; (pyvenv-activate "~/.virtualenvs/emacs")

;; putting this here as a reminder/alternative to the above
;; (pyvenv-workon 'emacs)

;; (setq python-shell-interpreter-args "--simple-prompt -i")
;; see https://github.com/jorgenschaefer/elpy/issues/1106, comment by RobinTourneme

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((python . t)))
