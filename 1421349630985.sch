((module fact racket
    (define (factorial x)
      (if (zero? x)
          1
          (* x (factorial (sub1 x)))))
    (provide (contract-out [factorial (-> (and/c integer? (>=/c 0)) (and/c integer? (>=/c 0)))]))))

#|Result:
#<void>
with-limit: out of time
  
Program is safe

|#
