((module f racket
  (provide (contract-out [f (integer? . -> . (</c 0)?)]))
  (define (f n)
    (/ 100 n))))

#|Result:
#<void>
Parser: Unknown symbol ? in module f
  
Program is safe

|#
