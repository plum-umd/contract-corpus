(module foo racket
      (provide (contract-out [foo (string? . -> . (or/c string? integer?))]))
      (define (foo s)
            (/ 1 3)))
