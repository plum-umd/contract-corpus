((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (+ 1.0j0 (- 100 n)))))

#|Result:
#<void>
Parser: Unknown symbol 1.0j0 in module f
  

|#