(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (if (= n 0) 
        1
        (* 2 (f (sub1 n))))))

(require 'f)
(f 100)