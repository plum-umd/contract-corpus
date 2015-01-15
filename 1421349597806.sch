((module fact racket
    (define (factorial x)
      (if (zero? x)
          1
          (* x (factorial (sub1 x)))))
    (provide (contract-out [factorial (-> (and/c real? (>=/c 0)) (and/c real? (>=/c 0)))]))))

#|Result:
#<void>
Contract violation: 'fact' violates its own contract.
Value
 -1.0
violates predicate
 (≥/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." fact)) (factorial 2.0))

  
Program is safe

|#
