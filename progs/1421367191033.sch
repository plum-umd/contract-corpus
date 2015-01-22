(module m racket
  (provide (contract-out [f (procedure? . -> . any/c)]))
  (define (f g) (g 5)))
