(module hello racket  
  (provide (contract-out [hello (integer? . -> . (or/c boolean? string? integer?))]))
  (define (hello n)
    (if (< 10 n) "hello" (if (> 5 n) #t 5))))
