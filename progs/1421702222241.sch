(module foo racket
      (provide (contract-out [foo ((=/c 1) . -> . (not/c (=/c 1/3)))]))
      (define (foo s)
            (/ s 3)))
