(module f racket
  (provide/contract 
    [f (integer? . -> . integer?)])
  (define (f n)
    (/ 1 1.0)))

