((module f racket
  (provide (contract-out [f ((and/c integer? (lambda (x) (not (= 100 x)))) . -> . any/c)]))
  (define (f n)
    (if (= n 99)
        1
        (/ 1 (- 100 n)))))

(require 'f)
(f 100))