((module foo racket
 
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
