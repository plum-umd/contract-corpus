(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (* 2 (f (sub1 n)))))

(require 'f)

