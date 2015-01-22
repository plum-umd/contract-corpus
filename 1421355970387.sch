(module m racket
  (provide
   (contract-out
    [f (s? . -> . boolean?)]))
  
  
  (struct s ())
  
  (define (f x) "hi"))

