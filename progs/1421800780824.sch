(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (require (only-in racket round))
  (define (f n)
    (round (/ 1 (- 100.5 n)))))
