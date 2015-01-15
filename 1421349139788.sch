((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (/ 42 1))))

#|Result:
#<void>

Program is safe
Program is safe

|#
