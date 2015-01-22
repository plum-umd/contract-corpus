(module f racket
  (provide (contract-out [f ((and/c real? (lambda (x) (not (= x 100)))) . -> . real?)]))
  (define (f n)
    (/ 1 (- 100 n))))
