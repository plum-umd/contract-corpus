((module f racket
  (provide (contract-out [f (natural-number/c . -> . natural-number/c)]))
  (define (f n)
    (+ 1 n))
  
  
))

#|Result:
#<void>
Parser: Unknown symbol natural-number/c in module f
  
Program is safe

|#
