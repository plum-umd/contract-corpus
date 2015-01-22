(module foo racket
  (provide (contract-out [total-length (string? string? . -> . integer?)]))
  (define (total-length s1 s2)
    (+ (string-length s1)
       (string-length s2)))
  (provide (contract-out [div2 ((and/c integer? (>/c 0)) . -> . real?)]))
  (define (div2 n)
    (/ n 2)))

(require 'foo)
(div2 5)

