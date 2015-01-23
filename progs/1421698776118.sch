(module f racket
  (provide (contract-out [f (real? . -> . real?)]))
  (define (f n)
    (expt 2)))
