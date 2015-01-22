(module m racket
  (define (f x) x)
  (provide 
   (contract-out 
    [f (-> (>/c 0) any/c)])))

