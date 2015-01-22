(module div racket
  (provide (contract-out
                         [length (-> (listof positive?) positive?)]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (length xs)
    (cond [(empty? xs) 0]
          [else (add1 (length (cdr xs)))])))
