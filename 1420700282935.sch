(module m racket
  (provide (contract-out [x integer?]))
  (define x 5))
