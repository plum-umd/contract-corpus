((module lastpair racket
  (provide/contract
   [lastpair (cons? . -> . cons?)])
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x))))

#|Result:
#<void>
Contract violation: 'lastpair' violates its own contract.
Value
 0.084
violates predicate
 cons?
An example module that breaks it:
 (module user racket
  (require (submod ".." lastpair))
  (lastpair (cons 0.555 0.084)))

  
Program is safe

|#
