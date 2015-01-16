((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . (lambda (x) x))]))
  (define (f g)
    (= (g 5) (g 5)))))

#|Result:
#<void>

Program is safe
Program is safe

|#
