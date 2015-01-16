((module fact racket
  (define (factorial x) 
    (if (zero? x) 
        1
        (* x (factorial (sub1 x)))))

  (provide
    (contract-out 
     [factorial (-> (>=/c 0) (>=/c 0))]))))

#|Result:
#<void>
with-limit: out of time
  
Program is safe

|#
