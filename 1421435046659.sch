((module foo racket
  (provide (contract-out [bar (string? string? . -> . integer?)]))
  (define (total-length s1 s2)
    (+ (string-length s1)
       (string-length s2)))
  (provide (contract-out [div2 ((and/c integer? (>/c 0)) . -> . real?)]))
  (define (div2 n)
    (/ n 2)))

(require 'foo) 
(total-length "hi" "bye")

)

#|Result:
#<void>
Parser: Unknown symbol total-length in module top-level
  
Program is safe

|#
