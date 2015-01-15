((module f racket
  (provide/contract [f (integer? . -> . integer?)])
  (provide/contract [g (any/c . -> . any/c)])
  (define (f v) v)
  (define (g x) (f x))))

#|Result:
#<void>

Program is safe

|#
