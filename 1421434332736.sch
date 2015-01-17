((module foo racket
  (provide (contract-out [total-length (string? string? . -> . integer?)]))
  (define (total-length s1 s2)
    (+ (string-length s1)
       (string-length s2)))
  
  (define (div2 n)
    (/ n 2)))

(require 'foo)
(div2 5)
)

#|Result:
#<void>
Parser: Unknown symbol div2 in module top-level
  
Program is safe

|#
