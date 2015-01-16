((module f racket
  (provide (contract-out [f ((integer? . -> . any/c) . -> . (lambda (x) x))]))
  (define (f g)
    (= (g 5) (g 5)))))

#|Result:
#<void>
Contract violation: 'f' violates '='.
Value produced by
 (begin (struct s₁₀ ()) (s₁₀))
violates predicate
 number?
An example module that breaks it:
 (module user racket
  (require (submod ".." f))
  (begin (struct s₁₀ ()) (f (λ (x) (s₁₀)))))

  
Program is safe

|#
