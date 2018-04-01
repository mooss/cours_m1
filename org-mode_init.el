;;allow org mode to use external languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
   (ditaa . t)))

;;do not ask confirmation to execute certain languages
(defun my-org-confirm-babel-evaluate (lang body)
  (not (seq-contains '("dot" "ditaa")
                     lang
                     'string=)))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


;;;;;;;;;;;;;;;;;;
;; conf loading ;;
;;;;;;;;;;;;;;;;;;
;; load latex conf
;;(load "org-mode_latex.el")
