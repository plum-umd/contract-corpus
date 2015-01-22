(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (+ 1.09.9 (- 100 n))))
