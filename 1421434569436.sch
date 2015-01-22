(module foo racket

  (provide (contract-out [div2 ((and/c integer? (>/c 0)) . -> . real?)]))
  (define (div2 n)
    (/ n 2)))

