((module f racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . zero?)]))
  (define (f g)
    (if (zero? (g 5))
        (* (g 5) (g 5))
        0))
  (define (</c x) #f)))

#|Result:
#<void>

Program is safe
Program is safe

|#
