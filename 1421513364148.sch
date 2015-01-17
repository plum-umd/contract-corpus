((module f racket
  (provide (contract-out 
            [f (->i ([x number?])
                    [res (x) (and/c number? (>=/c 0))])]))

  (define (f x)
    (+ x 9))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 0+1i
violates predicate
 (λ (x) (and (real? x) (>= x 0)))
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 0))

  
Program is safe

|#
