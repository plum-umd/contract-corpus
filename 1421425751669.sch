((module fib racket
  (provide (contract-out [+ (real? real? . -> . real?)]))
  (define (+ l r)
    (/ l r))
  (provide (contract-out [fib (integer? . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        1
        (+ (fib (- n 1)) (fib (- n 2))))))

(require 'fib)
(fib 0))

#|Result:
#<void>
Contract violation: 'fib' violates '/'.
Value
 0
violates predicate
 (≠/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." fib)) (+ 0 0))

  
Program is safe

|#
