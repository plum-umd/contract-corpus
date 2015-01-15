((module m1 racket
  (define (f x) x)
  (define c any/c)
  (define i integer?)
  (provide (contract-out [f (-> c i)]))))

#|Result:
#<void>
Contract violation: 'm1' violates its own contract.
Value
 0.218
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." m1)) (f 0.218))

  

|#
