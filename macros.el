;; keyboard macro to fix tide indentation
(fset 'tide-fix-indentation
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([home end 134217756 home 24 37 tab return 32 32 32 32 32 32 32 32 return home 24 37 32 32 32 32 return 32 32 return] 0 "%d")) arg)))
