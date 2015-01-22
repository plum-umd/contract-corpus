(module m racket
  (provide (contract-out [f (c? . -> . c?)]))
  (define (c? x) (> x 10))
  (define (f x) (f (+ x x))))
