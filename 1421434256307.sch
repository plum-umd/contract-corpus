((module foo racket
  (provide (contract-out [total-length (string? string? . -> . integer?)]))
  (define (total-length s1 s2)
    (+ (string-length s1)
       (string-length s2)))
  (define (div2 n)
    (/ n 2)))



)