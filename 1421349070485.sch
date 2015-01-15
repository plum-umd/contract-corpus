((module f racket
  (provide (contract-out [x any/c]))
  (define x 42)))

#|Result:
#<void>

Program is safe
Program is safe

|#
