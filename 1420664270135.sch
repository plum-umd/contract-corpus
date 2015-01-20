((module fib racket
  (provide/contract [fib (integer? . -> . integer?)])
  ;; return the nth number in the Fibonacci sequence
  (define (fib n)
    (cond
      [(= 0 n) 0]
      [(= 1 n) 1]
      [else (+ (fib (- n 1)) (fib (- n 2)))])))
  
  
(require 'fib)
(fib 2))