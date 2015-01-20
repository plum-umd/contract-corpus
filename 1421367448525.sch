((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))
  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  (define (not-div3 n)
    (not (= 0 (modulo n 3))))
  (define (f n)
    (let ([threes (in-range 3 n 3)]
          [fives  (for/list ([i (in-range 5 n 5)] #:when (not-div3 i)) i)])
      (+ (for/sum ([x threes]) x) (for/sum ([x fives])))))
  
  
))