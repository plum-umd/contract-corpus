((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . (lambda (x) x))]))
  (define (f g)
    (g (lambda (r) r)))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 (λ (x) x)
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f any/c))

  
Program is safe

|#
