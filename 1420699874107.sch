(module f racket
  (provide/contract 
   [f (integer? . -> . (integer? . -> . integer?))])

  (define (f n)
    (lambda (y) (+ n y))))

