((module m racket
  (provide/contract 
   [f ((and/c cons?
             (listof (integer? . -> . integer?)))
       . -> . 
       integer?)])
  
  (define (f fs)
    (if (empty? fs) 
        5
        ((car fs) 4)))))

#|Result:
#<void>

Program is safe

|#
