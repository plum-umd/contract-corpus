((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . (lambda (x) x))]))
  (define (f g)
    (not (= (g 5) (g 7))))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 #f
violates predicate
 (λ (x) x)
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f (λ (x) 0)))

  
Program is safe

|#
