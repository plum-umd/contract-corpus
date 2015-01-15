((module fact racket
  (provide (contract-out [factorial (-> (>=/c 0) (>=/c 0))]))
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  ))

#|Result:
#<void>
Contract violation: 'fact' violates '>='.
Value
 0.088
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." fact)) (factorial 0.088))

  

|#
