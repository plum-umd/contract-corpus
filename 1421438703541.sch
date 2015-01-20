((module factorial racket
  (define (fact x)
    (if (zero? x)
        1
        (* x (fact (sub1 x)))))
  
  (provide
   (contract-out
    [fact (-> (and/c integer? (>=/c 4))
              (and/c integer? (>=/c 1223452345234234230)))]))))