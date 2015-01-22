(module factorial racket
  (define (fact x)
    (if (zero? x)
        1
        (* x (fact x))))
  
  (provide
   (contract-out
    [fact (-> (>=/c 0) (>=/c 0))])))
