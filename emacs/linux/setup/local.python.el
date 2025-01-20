;; This depends on package having already been initialized, which
;; currently happens in ~/.emacs

;; see also https://robbmann.io/posts/006_emacs_2_python/
;; for basic python-mode capabilities

;; Fix path so we can find ipython
;; https://www.adventuresinwhy.com/post/eglot/
;; (add-to-list 'exec-path "/home/victor/.pyenv/shims")
;; (use-package exec-path-from-shell
;;   :ensure t
;;   :config
;;   (when (memq window-system '(mac ns x))
;;     (exec-path-from-shell-initialize)))

;; (require 'python)
(setq python-shell-completion-native-disabled-interpreters nil)
(setq python-shell-completion-native-enable t)
(setq python-check-command "flake8"
      python-shell-interpreter "/home/victor/.pyenv/shims/ipython"
      python-shell-interpreter-args "--simple-prompt -i"
      python-shell-unbuffered nil
)

(use-package python
    :interpreter ("ipython" . python-mode)
    :config
    (add-hook 'python-hook (lambda ()
                                  (setq
                                   python-indent-guess-indent-offset-verbose
                                   nil)
                                  )
              )
    (add-hook 'python-mode-hook 'company-mode)
    (add-hook 'python-mode-hook #'yas-minor-mode)
    (add-hook 'python-mode-hook 'eglot-ensure)
    (add-hook 'python-mode-hook (lambda () (setq eglot-connect-timeout 120)))
    (add-hook 'python-mode-hook (lambda () (setq eglot-autoshutdown t)))
    )


(run-python)
