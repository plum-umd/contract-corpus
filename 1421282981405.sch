(module f racket
  (provide (contract-out [f (integer? 3 -> 5 integer?)]))
  (define (f n)
    (/ 1 (- 100 n))))
