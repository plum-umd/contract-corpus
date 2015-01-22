(module div racket
  (provide (contract-out
                         [add (-> positive? positive? boolean?)]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (add a b)
    (cond [(= 0 a) b]
          [else (add (sub1 a) (add1 b))]))

)
