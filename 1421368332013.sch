((module f racket
  (provide (contract-out 
                         [divides (-> positive? positive? boolean?)]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (divides a b)
    (cond [(= 0 b) #t]
          [(< b a) #f]
          [else (divides a (- b a))]))


))

#|Result:
#<void>
with-limit: out of time
  
Program is safe

|#
