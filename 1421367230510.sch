((module m racket
  (provide (contract-out [f ((and/c procedure? (arity-includes/c 1)) . -> . any/c)]))
  (define (f g) (g 5))))

#|Result:
#<void>
Parser: Unknown symbol arity-includes/c in module m
  
Program is safe

|#
