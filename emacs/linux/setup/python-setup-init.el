;; init.el --- Fun stuff all around -*- lexical-binding: t; -*-

;; Commentary:
;; This is a simple init.el which offers a Python configuration.  Each package
;; usage is annotated with the how and why of its use.  `use-package' is used to
;; manage the configuration as it provides lots of facilities to load modes,
;; define custom variables and key-maps, etc.

;; Code:

;; This is the package system for Emacs. We have to load it to install `use-package'.
(require 'package)


;; ELPA and MELPA are the package repositories from which we can install
;; packages from the Emacs community.
;; (setq package-archives
;;       '(("melpa" . "https://melpa.org/packages/")
;; 	("elpa" . "https://elpa.gnu.org/packages/")))

;; Make sure `use-package' is available and install it if it isn't already.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; <OPTIONAL THEMING>

;; Modus-themes are just excellent, easy to read and work really well
;; with code as well as text (org-mode, markdown).
;;;

;; (use-package modus-themes
;;   :ensure t
;;   :config
;;     (setq modus-themes-org-blocks 'gray-background
;; 	modus-themes-fringes 'subtle
;; 	modus-themes-italic-constructs t
;; 	modus-themes-bold-constructs t
;; 	modus-themes-syntax '(alt-syntax)
;; 	modus-themes-hl-line '(intense)
;; 	modus-themes-paren-match '(intense)
;; 	modus-themes-mode-line '(borderless))
;;     (setq modus-themes-headings
;;         (quote ((1 . (background overline variable-pitch 1.4))
;;                 (2 . (overline rainbow variable-pitch 1.25))
;;                 (3 . (overline 1.1))
;;                 (t . (monochrome))))))

;; Running modus-themes depending on the time of the day.  <ATTENTION>
;; You need to set the longitude and latitude to your city's for this
;; to be accurate.
;;;

;; (use-package solar
;;   :ensure nil
;;   :custom
;;   ;; Brussels ;)
;;   (calendar-latitude 50.85)
;;   (calendar-longitude 4.35))

;; (use-package circadian
;;   :ensure t
;;   :after solar
;;   :config
;;   (setq circadian-themes '((:sunrise . modus-operandi)
;;                            (:sunset  . modus-vivendi)))
;;   (circadian-setup))


;;========================================
;; Python
;;========================================

;; `python.el' provides `python-mode' which is the builtin major-mode for the
;; Python language.


(use-package python
  :config
  ;; Remove guess indent python message
  (setq python-indent-guess-indent-offset-verbose nil))

;; Hide the modeline for inferior python processes.  This is not a necessary
;; package but it's helpful to make better use of the screen real-estate at our
;; disposal. See: https://github.com/hlissner/emacs-hide-mode-line.

;; (use-package hide-mode-line
;;   :ensure t
;;   :defer t
;;   :hook (inferior-python-mode . hide-mode-line-mode))


;;<OPTIONAL> I use poetry (https://python-poetry.org/) to manage my python environments.
;; See: https://github.com/galaunay/poetry.el.
;; There are alternatives like https://github.com/jorgenschaefer/pyvenv.
;; (use-package poetry
;;   :ensure t
;;   :defer t
;;   :config
;;   ;; Checks for the correct virtualenv. Better strategy IMO because the default
;;   ;; one is quite slow.
;;   (setq poetry-tracking-strategy 'switch-buffer)
;;   :hook (python-mode . poetry-tracking-mode))

;;; (use-package pyenv-mode)

;; <OPTIONAL> Buffer formatting on save using black.
;; See: https://github.com/pythonic-emacs/blacken.
;;;
;; (use-package blacken
;;   :ensure t
;;   :defer t
;;   :custom
;;   (blacken-allow-py36 t)
;;   (blacken-skip-string-normalization t)
;;   :hook (python-mode-hook . blacken-mode))

;; <OPTIONAL> Numpy style docstring for Python.  See:
;; https://github.com/douglasdavis/numpydoc.el.  There are other packages
;; available for docstrings, see: https://github.com/naiquevin/sphinx-doc.el
;;;
;; (use-package numpydoc
;;   :ensure t
;;   :defer t
;;   :custom
;;   (numpydoc-insert-examples-block nil)
;;   (numpydoc-template-long nil)
;;   :bind (:map python-mode-map
;;               ("C-c C-n" . numpydoc-generate)))

;; Provide drop-down completion.
;;;
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :custom
;;   ;; Search other buffers with the same modes for completion instead of
;;   ;; searching all other buffers.
;;   (company-dabbrev-other-buffers t)
;;   (company-dabbrev-code-other-buffers t)
;;   ;; M-<num> to select an option according to its number.
;;   (company-show-numbers t)
;;   ;; Only 2 letters required for completion to activate.
;;   (company-minimum-prefix-length 3)
;;   ;; Do not downcase completions by default.
;;   (company-dabbrev-downcase nil)
;;   ;; Even if I write something with the wrong case,
;;   ;; provide the correct casing.
;;   (company-dabbrev-ignore-case t)
;;   ;; company completion wait
;;   (company-idle-delay 0.2)
;;   ;; No company-mode in shell & eshell
;;   (company-global-modes '(not eshell-mode shell-mode))
;;   ;; Use company with text and programming modes.
;;     :hook ((text-mode . company-mode)
;;            (prog-mode . company-mode)))

;; <EGLOT> configuration, pick this or the LSP configuration but not both.
;; Using Eglot with Pyright, a language server for Python.
;; See: https://github.com/joaotavora/eglot.
;;;
;; (use-package eglot
;;   :ensure t
;;   :defer t
;;   :hook (python-mode . eglot-ensure))

;; <LSP> configuration, pick this or the Eglot configuration, but not both.

;; (use-package lsp-mode
;;   :ensure t
;;   :defer t
;;   :defines (lsp-keymap-prefix lsp-mode-map)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :custom
;;   ;; Read the documentation for those variable with `C-h v'.
;;   ;; This reduces the visual bloat that LSP sometimes generate.
;;   (lsp-eldoc-enable-hover nil)
;;   (lsp-signature-auto-activate nil)
;;   (lsp-completion-enable t)
;;   :hook ((lsp-mode . lsp-enable-which-key-integration))
;;   :commands (lsp lsp-deferred))

;; (use-package lsp-pyright
;;   :ensure t
;;   :defer t
;;   ;; Launches pyright when a python buffer is opened.
;;   :hook ((python-mode . (lambda ()
;; 			  (require 'lsp-pyright)
;; 			  (lsp-deferred)))))

;; init.el ends here
