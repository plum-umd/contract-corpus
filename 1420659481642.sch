((module m racket
  (provide/contract [f (any/c . -> . integer?)])
  (define (f x)
    (if (integer? x) (+ x 5) 5)))
)