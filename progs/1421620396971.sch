(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (if (= n 1) 
        n
        (* 2 (f (sub1 n))))))

(require 'f)
(f 100)