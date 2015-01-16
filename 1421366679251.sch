((module f racket
  (provide (contract-out [x (</c 10)]))
  (define x 5)
  (define (</c x) #f)))

#|Result:
#<void>

Program is safe
Program is safe

|#
