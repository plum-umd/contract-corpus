((module div racket
  (provide (contract-out
                         [add (-> positive? positive? boolean?)]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (add a b)
    (cond [(= 0 a) b]
          [else (add (sub1 a) (add1 b))]))

))

#|Result:
#<void>
Contract violation: 'div' violates its own contract.
Value
 0
violates predicate
 boolean?
An example module that breaks it:
 (module user racket (require (submod ".." div)) (add 0 0))

  
Program is safe

|#
