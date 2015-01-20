((module m racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f x) (f (+ x x)))))