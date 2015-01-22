(module f racket
  (provide (contract-out [f (integer? . -> . any/c)]))
  (define (f n)
    (/ 1 (- 100 n))))

(require 'f)
(f 100)
