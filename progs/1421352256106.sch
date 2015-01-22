(module fact racket
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  (provide 
   (contract-out 
    [factorial (-> (lambda (x) (>= x 0)) 
                   (lambda (x) (>= x 0)))])))
               
               
