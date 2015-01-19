(module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (if (= n 0) 
        1
        (* 2.0 (f (sub1 n))))))

(module g racket
  (provide (contract-out [g (->i ([x integer?]) (res (lambda (r) (> x r))))])))

(require 'f)
(f 100)