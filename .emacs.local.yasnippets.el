;; yasnippets
(add-to-list 'load-path
              "~/.emacs.d/elpa/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/elpy-1.8.0/snippets/python-mode/"
	"~/.emacs.d/plugins/yasnippet-snippets/snippets"
	"~/.emacs.d/mysnippets"
	))
;; was "emacs.d/elpa/yasnippet/snippets"
(yas-global-mode 1)
