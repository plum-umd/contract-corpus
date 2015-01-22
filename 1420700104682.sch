(module m racket
  (provide/contract 
   [f ((and/c cons?
             (listof (integer? . -> . integer?)))
       . -> . 
       integer?)])
  
  (define (f fs)
    ((car fs) 4)))
