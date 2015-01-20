((module m racket
  (provide/contract 
   [f ((listof (integer? . -> . integer?))
       . -> . 
       integer?)])
  
  (define (f fs)
    (if (empty? fs) 
        5
        ((car fs) 4)))))