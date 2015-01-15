((module f racket
  (provide/contract 
    [f (integer? . -> . (integer? . -> . integer?))])

(define (f x) (lambda (y) (+ x y))))
)

#|Result:
#<void>

Program is safe
Program is safe

|#
