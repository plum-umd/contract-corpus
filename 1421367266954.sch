((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))
  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  (define (f n)
    (+ 1 n))
  
  
))

#|Result:
#<void>

Program is safe
Program is safe

|#
