((module m1 racket
  (define (f x) x)
  (define c any/c)
  (provide (contract-out [f (-> c integer?)]))))

#|Result:
#<void>
Contract violation: 'm1' violates its own contract.
Value
 0.386
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." m1)) (f 0.386))

  

|#
