((module hello racket

  (define string/int (or/c string integer?))
  
  (provide (contract-out [hello (integer? . -> . (or/c boolean? string? integer?))]))
  (define (hello n)
    (if (< 10 n) "hello" (if (> 5 n) #t 5)))))

#|Result:
#<void>
Parser: Unknown symbol string in module hello
  

|#
