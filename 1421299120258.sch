(
(module f racket
  (provide (contract-out [f (-> (and/c (not/c (=/c 100)) integer?) integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))