((module m racket
  (provide (contract-out [f (c? . -> . c?)]))
  (define (c? x) (and (integer? x) (> x 10)))
  (define (f x) (f (+ x x)))))

#|Result:
#<void>
with-limit: out of time
  
Program is safe

|#
