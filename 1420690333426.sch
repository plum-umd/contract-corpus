((module f racket
  (provide/contract [f (integer? . -> . integer?)])
  (define (f n)
    (/ 1 (- 100 n))))

(module user racket (require (submod ".." f)) (f 100)))