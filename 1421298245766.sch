((module lastpair racket
  (provide
   (contract-out [lastpair (cons? . -> . cons?)]))
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x))))

#|Result:
#<void>
Contract violation: 'lastpair' violates its own contract.
Value
 0.344
violates predicate
 cons?
An example module that breaks it:
 (module user racket
  (require (submod ".." lastpair))
  (lastpair (cons 0.357 0.344)))

  

|#
