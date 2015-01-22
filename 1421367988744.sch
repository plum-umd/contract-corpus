(module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (divides a b)
    (cond [(= 0 b) #t]
          [(< b a) #f]
          [else (divides a (- b a))]))

  (define (any-divides xs x)
    (cond [(empty? xs) #f]
          [else (or (divides (car xs) x) (any-divides (cdr xs) x))]))
   
)
