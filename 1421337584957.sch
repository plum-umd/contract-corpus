((module f racket
  (provide (contract-out [f (odd? . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))