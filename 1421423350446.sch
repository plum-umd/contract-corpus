((module sqr racket
  (provide 
   (contract-out 
    [sqr (integer? . -> . (>=/c 0))]))

  (define (sqr n)
    (* n n)))
)

#|Result:
#<void>

Program is safe
Program is safe

|#
