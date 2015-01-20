((module sqr racket
  (provide 
   (contract-out 
    [sqr ((and/c real? (lambda (x) (not (= x 0)))) . -> . (and/c real? (lambda (x) (> x 0))))]))
  
  (define (sqr n)
    (* n n)))
)