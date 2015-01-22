(module factorial racket
  (define (fact x)
    (if (zero? x)
        1
        (* x (fact (sub1 x)))))
  
  (provide
   (contract-out
    [fact (-> (and/c integer? (>=/c 1))
              (and/c integer? (>=/c 1)))])))
