((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))

  (define (not-div3 n)
    (cond [(= 0 n) #f]
          [(< n 3) #t]
          [else (not-div3 (- n 3))]))
  
  (define (add-up xs)
    (cond [(stream-empty? xs) 0]
          [else (+ (stream-first xs) (add-up (stream-rest xs)))]))

  (define (f n)
    (let ([threes (in-range 3 n 3)]
          [fives  (for/list ([i (in-range 5 n 5)] #:when (not-div3 i)) i)])
      (+ (add-up threes) (add-up fives))))
  
  
))