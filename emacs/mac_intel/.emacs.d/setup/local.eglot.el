(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright")
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))

;; Fix path so we can find pylsp
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; configure for python:
(use-package eglot
  :ensure t
  :defer t
  :config
  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
  (setq-default eglot-workspae-configuration
		'((:pylsp . (:configuratinSources ["flake8"] :plugins (:pycodestyle (:enabled nil) :mccabe (:enabled nil) :flake8 (:enabled t))))))
  :hook ((python-mode . eglot-ensure)))
		
