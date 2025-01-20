;; Elpy:
(when (require 'elpy nil t)
  (pyvenv-activate "~/.pyenv/versions/emacs-3-7-3")
  (setq elpy-rpc-virtualenv-path 'current)
  (elpy-enable)
  (setq python-check-command "flake8"
	python-shell-interpreter "ipython"
	python-shell-interpreter-args "--simple-prompt -i"
	elpy-rpc-backend "jedi"
	elpy-shell-echo-output nil
	elpy-rpc-ignored-buffer-size (* 1024 1024 1024)
	)
  )

;; elpy wants this for something and won't shut the fuck up if it doesn't find it
;; ON EVERY GODDAM KEYPRESS, so:
(defun eldoc-docstring-format-sym-doc (a b c))

;; see https://github.com/jorgenschaefer/elpy/issues/1379
;; (defun elpy--xref-backend ()
;;   "Return the name of the elpy xref backend."
;;   (if (or (and (not (elpy-rpc--process-buffer-p elpy-rpc--buffer))
;;                (elpy-rpc--get-rpc-buffer))
;;           elpy-rpc--jedi-available)
;;       'elpy
;;     nil))

;; try this: https://www.reddit.com/r/emacs/comments/ushfzn/python_ide_using_eglot/
;; also this: https://gist.github.com/Nathan-Furnal/b327f14e861f009c014af36c1790ec49
