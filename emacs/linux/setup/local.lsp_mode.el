;; https://www.mattduck.com/lsp-python-getting-started.html
(use-package lsp-mode
  :hook
  ((python-mode . lsp))
  :commands lsp)

;; (lsp-register-custom-settings
;;  '(("pyls.plugins.flake8.enabled" t t)))

(setq lsp-pyls-plugins-flake8-enabled t)

;; (use-package lsp-ui
;;   :commands lsp-ui-mode)
