((module f racket
  (provide (contract-out [f ((>/c 0) . -> . (>/c 0))]))
  (define (f n)
    (+ 1 n)))

(require (submod ".." f)) (f 0.255))