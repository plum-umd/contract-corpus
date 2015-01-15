((module m1 racket
  (define (f x) x)
  (define c any/c)
  (provide (contract-out [f (-> c c)]))))

#|Result:
#<void>

Program is safe
Program is safe

|#
