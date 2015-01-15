((module sqr racket
  (define (positive? n) (> n 0))
  
  (define (sqr n) (* n n))
  
  (provide 
   (contract-out
    [sqr (integer? . -> . (and/c integer? positive?))]
    [positive? (real? . -> . boolean?)])))
  

)

#|Result:
#<void>
Contract violation: 'sqr' violates its own contract.
Value
 0
violates predicate
 (>/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." sqr)) (sqr (• integer?)))

  

|#
