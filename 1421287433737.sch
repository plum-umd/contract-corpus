((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (+ 1.0 (- 0.1 0.1) (- 100 n)))))