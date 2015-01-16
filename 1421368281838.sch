((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]
                         [divides (-> positive? positive? boolean?)]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (divides a b)
    (cond [(= 0 b) #t]
          [(< b a) #f]
          [else (divides a (- b a))]))

;  (define (f n)
;    (if (divides 2 3) 1 2))

   
))

#|Result:
#<void>
with-limit: out of time
  
Program is safe

|#
