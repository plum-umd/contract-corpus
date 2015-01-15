((module m racket
  (define (loop x) 
    (begin (loop x)
           "hi"))
  
  (provide
   	(contract-out 
     [loop (-> number? number?)])))
           


)

#|Result:
#<void>

Program is safe
Program is safe

|#
