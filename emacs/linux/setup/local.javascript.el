;; attempt to load javascript mode:
(autoload 'javascript-mode
     "/usr/share/emacs/20.6/site-lisp/term/javascript-cust"
     "javascript mode" t nil)    

(setq auto-mode-alist
         (append '(("\\.js$" . javascript-mode))
                  auto-mode-alist))


;; php mode:
(defun php-mode-hook ()
  (setq tab-width 4
        c-basic-offset 4
        c-hanging-comment-ender-p nil
  indent-tabs-mode
(not
 (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
      (string-match "\.php$" (buffer-file-name))))))

(setq auto-mode-alist
         (append '(("\\.php$" . php-mode))
                  auto-mode-alist))

