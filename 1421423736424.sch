((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . not)]))
  (define (f g)
    (not (= (g 5) (g 7))))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 #t
violates predicate
 false?
An example module that breaks it:
 (module user racket
  (require (submod ".." f))
  (f (λ (x) (if (procedure? x) (λ (x₁) (0.099 x₁)) (case x ((7) 1) ((5) 0))))))

  
Program is safe

|#
