((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))

  (define (not-div3 n)
    (cond [(= 0 n) #f]
          [(< n 3) #t]
          [else (not-div3 (- n 3))]))
  
  (define (add-up xs)
    (cond [(empty? xs) 0]
          [else (+ (car xs) (add-up (cdr xs)))]))

  (define (f n)
    (map (lambda (x) (add1 x)) '(1 2 3)))
  
  
))