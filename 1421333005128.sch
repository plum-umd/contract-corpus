((module f racket
  (provide (contract-out [f (->* (integer?) integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Parser: Unknown symbol ->* in module f
  
Program is safe

|#
