((module lastpair racket
  (provide/contract
   [lastpair (cons? . -> . cons?)])
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x))))

#|Result:
#<void>
Contract violation: 'lastpair' violates its own contract.
Value
 0.227
violates predicate
 cons?
An example module that breaks it:
 (module user racket
  (require (submod ".." lastpair))
  (lastpair (cons 0.290 0.227)))

  

|#
