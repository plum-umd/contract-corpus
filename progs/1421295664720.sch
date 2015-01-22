(module sqr racket
  (provide 
   (contract-out 
    [sqr ((and/c integer? (lambda (x) (not (= x 0)))) . -> . (and/c integer? (lambda (x) (> x 0))))]))
  
  (define (sqr n)
    (* n n)))

