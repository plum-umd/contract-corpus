(module f racket
  (provide (contract-out [f (-> exact-nonnegative-integer? integer?)]))
  (define (f n)
    (/ 1 (- 100 n))))
