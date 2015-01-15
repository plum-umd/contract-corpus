((module f racket
  (provide (contract-out [f (odd? . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Parser: Unknown symbol odd? in module f
  

|#
