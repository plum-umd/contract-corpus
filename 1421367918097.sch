((module m racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . string?)]))
  (define (f x) (not (= (x 4) (x 4))))))

#|Result:
#<void>
Internal: expect Z3 to have instantated `integer?`
  
Program is safe

|#
