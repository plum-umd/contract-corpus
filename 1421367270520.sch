((module m racket
  (provide (contract-out [f ((and/c procedure?) . -> . any/c)]))
  (define (f g) (arity-includes g 5))))