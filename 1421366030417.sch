((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . (lambda (x) x))]))
  (define (f g)
    (not (= (g 5) (g 7))))))

#|Result:
#<void>
Internal: expect Z3 to have instantated `integer?`
  
Program is safe

|#
