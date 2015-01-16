((module m racket
  (provide (contract-out [f (c? . -> . c?)]))
  (define (c? x) (integer? x) #;(and (integer? x) (> x 10)))
  (define (f x) (f (+ x x)))))

#|Result:
#<void>

Program is safe
Program is safe

|#
