((module sqr racket
  (provide 
   (contract-out 
    [sqr (integer? . -> . (>/c 0))]))

  (define (sqr n)
    (* n n)))
)

#|Result:
#<void>
Contract violation: 'sqr' violates its own contract.
Value
 0
violates predicate
 (λ (x) (and (real? x) (> x 0)))
An example module that breaks it:
 (module user racket (require (submod ".." sqr)) (sqr 0))

  
Program is safe

|#
