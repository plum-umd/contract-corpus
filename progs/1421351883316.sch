(module m racket
  (define (loop x) 
    (begin (loop x)
           "hi"))
  
  (provide
   	(contract-out 
     [loop (-> number? number?)])))
           



