((module m racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . 
                             (integer? . -> . true?))]))
  (define (f g)
    (λ (n)
      (not (= (g n) (g n)))))))

#|Result:
#<void>
Contract violation: 'm' violates its own contract.
Value
 #f
violates predicate
 true?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (f (λ (x) 0)))

  
Program is safe

|#
