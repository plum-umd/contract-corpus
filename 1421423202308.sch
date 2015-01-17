((module sqr racket
  (provide 
   (contract-out 
    [sqr (integer? . -> . (and/c integer? (lambda (x) (> x 0))))]))

  (define (sqr n)
    (* n n)))
)

#|Result:
#<void>
Contract violation: 'sqr' violates its own contract.
Value
 0
violates predicate
 (>/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." sqr)) (sqr 0))

  
Program is safe

|#
