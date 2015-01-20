((module m racket
  (define (loop x) 
    (loop x)
    "hi")
  
  (provide
   	(contract-out 
     [loop (-> number? number?)])))
           


)