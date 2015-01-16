((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . (lambda (x) x))]))
  (define (f g)
    (= (g 5) (g (lambda (r) r))))))

#|Result:
#<void>
Internal: expect Z3 to have instantated `integer?`
  
Program is safe

|#
