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





;; (fset 'python-insert-warn
;;    "\C-iwarn(\"\" % ())\C-r\"\C-m")
;; (add-hook 'python-mode-hook '(lambda() (local-set-key "\C-cw" 'python-insert-warn)))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((python . t)))
