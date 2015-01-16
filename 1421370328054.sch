((module m racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f x) (f (+ x x)))))

#|Result:
#<void>

Program is safe
Program is safe

|#
