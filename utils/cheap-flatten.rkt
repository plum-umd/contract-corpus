#lang racket

;; One-off script to flatten a list of modules

;; mkdir new
;; for f in *sch; do cat $f | racket utils/cheap-flatten.rkt > new/$f ; done
;; mv new/*sch .


;; str -> str
(define (remove-parens str)
  (regexp-replaces str
                   '([#rx"(.*)\\)$" "\\1\n"]
                     [#rx"^\\(\\(module" "(module"])))

(define (remove-parens? str)
  (regexp-match #rx"^\\(\\(module" str))

(define (clean str)
  (if (remove-parens? str)
      (remove-parens str)
      str))

(display (clean (port->string (current-input-port))))



  