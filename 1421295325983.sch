((module lastpair racket
  (provide
   (contract-out [lastpair (cons? . -> . cons?)]))
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x))))

#|Result:
#<void>
Contract violation: 'lastpair' violates its own contract.
Value
 0.726
violates predicate
 cons?
An example module that breaks it:
 (module user racket
  (require (submod ".." lastpair))
  (lastpair (cons 0.707 0.726)))

  

|#
