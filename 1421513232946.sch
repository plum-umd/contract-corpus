((module f racket
  (provide (contract-out [f ((and/c integer? positive?) . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))