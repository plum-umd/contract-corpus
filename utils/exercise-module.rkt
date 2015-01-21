#lang racket
(require try-scv-racket/eval)

(define (try-module m)
  (match-define (list-rest 'module m-name 'racket _) m)
  (define ev (make-ev-rkt))
  (ev m)  
  (define-values (vals stxs) (ev `(module->exports '',m-name)))
  (ev `(require ',m-name))
  (for/list ([i (dict-ref (append vals stxs) 0)]) 
    (ev `(contract-exercise ,(car i)))))
