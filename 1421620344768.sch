(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (sqr (f (/ n 2)))))

(require 'f)
(f 100)