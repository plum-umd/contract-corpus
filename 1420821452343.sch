((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n))))

(require 'f)
(+ 1 2)
(/ 1 0))