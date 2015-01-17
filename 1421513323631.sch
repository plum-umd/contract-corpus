((module f racket
  (provide (contract-out 
            [f (->i ([x number?])
                    [res (x) (and/c number? (>=/c 0))])]))

  (define (f x y)
    (+ x y))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 (λ (x y) (+ x y))
violates predicate
 (arity-includes/c 1)
An example module that breaks it:
 (module user racket (require (submod ".." f)) (0 f))

  
Program is safe

|#
