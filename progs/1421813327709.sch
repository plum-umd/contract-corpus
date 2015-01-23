(module f racket
  (provide (contract-out [f (integer? . -> . real?)]))
  (define (f n) (/ 1 (- 100 n))))
