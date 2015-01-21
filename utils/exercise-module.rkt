#lang racket
(require try-scv-racket/eval
         "shared.rkt")

;; Sexpr -> Void
(define (try-module m)
  (match m
    [(list-rest 'module m-name 'racket _)
     (define ev (make-ev-rkt))
     (ev m)  
     (define-values (vals stxs) (ev `(module->exports '',m-name)))
     (ev `(require ',m-name))
     (for/list ([i (dict-ref (append vals stxs) 0)]) 
       (ev `(contract-exercise ,(car i))))]
    [_ (void)]))

#;
(for-each try-module
          (read (open-input-file "../1420736099704.sch")))
     

  


