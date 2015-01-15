((module fact racket
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  (provide (contract-out [factorial (-> number? number?)]))))

#|Result:
#<void>

Program is safe

|#