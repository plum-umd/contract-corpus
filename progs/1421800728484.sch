(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (round (/ 1 (- 100.5 n)))))
