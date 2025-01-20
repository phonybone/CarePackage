;; https://github.com/joaotavora/eglot

;; not currently used, but maybe a good source:
;; https://www.adventuresinwhy.com/post/eglot/


(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-auto-guess-root nil)
  (lsp-auto-select-workspace t)
  (lsp-keymap-prefix "M-m l")
  (lsp-modeline-diagnostics-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-auto-execute-action nil)
  (lsp-before-save-edits nil)
  (lsp-eldoc-enable-hover nil)
  (lsp-diagnostic-package :none)
  (lsp-completion-provider :none)
  (lsp-file-watch-threshold 1500)  ; pyright has more than 1000
  (lsp-enable-links nil)
  (lsp-headerline-breadcrumb-enable nil)
  ;; Maybe set in future:
  ;;(lsp-enable-on-type-formatting nil)
  :custom-face
  (lsp-face-highlight-read ((t (:underline t :background nil :foreground nil))))
  (lsp-face-highlight-write ((t (:underline t :background nil :foreground nil))))
  (lsp-face-highlight-textual ((t (:underline t :background nil :foreground nil))))
  :hook
  (lsp-mode . lsp-enable-which-key-integration))

;; see https://github.com/KaratasFurkan/.emacs.d
(defun fk/async-process (command &optional name filter)
  "Start an async process by running the COMMAND string with bash. Return the
process object for it.

NAME is name for the process. Default is \"async-process\".

FILTER is function that runs after the process is finished, its args should be
\"(process output)\". Default is just messages the output."
  (make-process
   :command `("bash" "-c" ,command)
   :name (if name name
           "async-process")
   :filter (if filter filter
             (lambda (process output) (message (s-trim output))))))

(use-package lsp-pyright
  :after lsp-mode
  :custom
  ;; (lsp-pyright-auto-import-completions nil)
  (lsp-pyright-typechecking-mode "off")
  :config
  (fk/async-process
   "npm outdated -g | grep pyright | wc -l" nil
   (lambda (process output)
     (pcase output
       ("0\n" (message "Pyright is up to date."))
       ("1\n" (message "A pyright update is available."))))))

;; attempt to quiet python window messages:
;; https://stackoverflow.com/questions/75103221/emacs-remove-python-el-eval-message
(require 'cl-seq)
(defun python-comint-filter (output)
  (let* ((regexp "^.*__PYTHON_EL_\\(.*\\)\\(.*\\)[[:space:]]*$")
         (lines (split-string output "\n"))
         (filtered-lines (cl-remove-if (lambda (line)
                                      (or (string-match-p regexp line)
                                          (string-match-p "^\\s-*$" line))) 
                                    lines)))

    (if (equal (length lines) (length filtered-lines))
        output
      (mapconcat 'identity filtered-lines "\n"))))
(add-hook 'comint-preoutput-filter-functions 'python-comint-filter)

;; typescript
;; npm install -g typescript-language-server typescript
;;
