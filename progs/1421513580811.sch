(module f racket
  (provide (contract-out [f ((and/c integer? (not/c (=/c 100))) . -> . real?)]))
  (define (f n)
    (/ 1 (- 100 n))))
