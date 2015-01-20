((module f racket
  (provide (contract-out [f (even? . -> . integer?)]))
  (define (f n)
    (add1 n))))