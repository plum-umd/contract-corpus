((module fact racket
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  (provide (contract-out [factorial (-> (>= 0) number?)]))))

#|Result:
#<void>
Contract violation: 'fact' violates '>='.
Wrong arity
An example module that breaks it:
 (module user racket (require (submod ".." fact)) (0.914 factorial))

  

|#
