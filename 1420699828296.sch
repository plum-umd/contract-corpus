(module f racket
  (provide/contract 
    [f (integer? . -> . (integer? . -> . integer?))])

(define (f x) (lambda (y) (+ x y))))

