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
    (let ([threes (for/list ([i (in-range 3 n 3)]) i)]
          [fives  (for/list ([i (in-range 5 n 5)] #:when (not-div3 i)) i)])
      (+ (add-up threes) (add-up fives))))
  
  
))

#|Result:
#<void>
Parser: Unknown symbol for/list in module f
  
Program is safe

|#
