((module f racket
  (provide (contract-out [f ((and/c integer? (≠/c 0)) . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Parser: Unknown symbol ≠/c in module f
  
Program is safe

|#
