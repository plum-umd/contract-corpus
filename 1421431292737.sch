((module fib racket
  (provide (contract-out [fib (integer? . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        n
        (+ (fib (- n 1)) (fib (- n 2))))))
)

#|Result:
#<void>

Program is safe
Program is safe

|#
