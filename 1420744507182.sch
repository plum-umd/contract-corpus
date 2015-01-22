(module foo racket  

  (define bar 1)

  (provide (contract-out [foo (integer? . -> . (or/c boolean? string? integer?))]))
  (define (foo n)
    (if (< 10 n) "hello" (if (> 5 n) #t 5))))
