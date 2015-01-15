((module foo racket  

  (provide (contract-out [foo (integer? . -> . (or/c boolean? string? integer?))]))

  (define (foo n)
    (if (< 10 n) "hello" (if (> 5 n) #t 5))))

(require 'hello)
(hello 6)
(hello 4)
(hello 20)

)

#|Result:
#<void>
hash-ref: no value found for key
  key: 'hello
  

|#
