((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))
  (define (f n)
    (+ 1 n))
  
  
))