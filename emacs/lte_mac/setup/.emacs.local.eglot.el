;; pylsp
(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred


(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))

  (setq-default eglot-workspace-configuration
                '((:pylsp . (:configurationSources ["flake8"] :plugins (:pycodestyle (:enabled nil) :mccabe (:enabled nil) :flake8 (:enabled t))))))

  :hook
  ((python-mode . eglot-ensure)))


;; pyright
;; https://emacs-lsp.github.io/lsp-pyright/
;; (use-package lsp-pyright
;;   :ensure t
;;   :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs 
;;                '(python-mode . ("pylsp" 
;;                                 :server-id "pylsp")))
;;   ;; Or, if you prefer pyright:
;;   ;; (add-to-list 'eglot-server-programs 
;;   ;;              '(python-mode . ("/Users/victor.cassen@leveltenenergy.com/.nvm/versions/node/v20.10.0/bin/pyright")))
;; )
