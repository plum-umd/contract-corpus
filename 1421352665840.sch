((module m racket
  (define x 0.007)
  (provide 
   (contract-out 
    [x (lambda (x) (>= x 0))])))
               )

#|Result:
#<void>

Program is safe
Program is safe

|#
