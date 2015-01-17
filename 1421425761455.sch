((module fib racket
  (provide (contract-out [+ (real? real? . -> . real?)]))
  (define (+ l r)
    (* l r))
  (provide (contract-out [fib (integer? . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        1
        (+ (fib (- n 1)) (fib (- n 2))))))

(require 'fib)
(fib 0))

#|Result:
#<void>

Program is safe
Program is safe

|#
