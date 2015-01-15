((module f racket
  (provide (contract-out [f ((>/c 0) . -> . (>/c 0))]))
  (define (f n)
    (+ 1 n)))

(require (submod ".." f)) (f 0.255))

#|Result:
#<void>
hash-ref: no value found for key
  key: ".."
  
Program is safe

|#
