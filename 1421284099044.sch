((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (add1 n))))

#|Result:
#<void>

Program is safe
Program is safe

|#
