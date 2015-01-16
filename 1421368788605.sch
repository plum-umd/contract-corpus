((module div racket
  (provide (contract-out
                         [length (parametric/c-> (A) (-> (listof A) positive?))]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (length xs)
    (cond [(empty? xs) 0]
          [else (add1 (length (cdr xs)))]))
))

#|Result:
#<void>
Parser: Unknown symbol parametric/c-> in module div
  
Program is safe

|#
