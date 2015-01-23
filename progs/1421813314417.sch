(module f racket
  (provide (contract-out [f (integer? . -> . real?)]))
  (define (f n)
    (if (= n 100) 1 (/ 1 (- 100 n)))))
