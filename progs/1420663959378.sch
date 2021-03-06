(module fib racket
  (provide/contract [min (integer? . -> . integer?)])
  ;; return the nth number in the Fibonacci sequence
  (define (f n)
    (cond
      [(= 0 n) 0]
      [(= 1 n) 1]
      [else (+ (f (- n 1)) (f (- n 2)))])))
