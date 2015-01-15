((module m racket
  (define (f x) x)
  (provide 
   (contract-out 
    [f (-> (lambda (x) (>= x 0)) any/c)])))

               )

#|Result:
#<void>
Contract violation: 'm' violates '>='.
Value
 0.846
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (f 0.846))

  
Program is safe

|#
