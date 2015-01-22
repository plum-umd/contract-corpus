(module m racket
  (define x 0.007)
  (provide 
   (contract-out 
    [x (lambda (x) (>= x 0))])))
               
