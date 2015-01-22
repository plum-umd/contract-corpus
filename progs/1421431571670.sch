(module fib racket
  (provide (contract-out [fib ((and/c integer? (>/c 0)) . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        n
        (+ (fib (- n 1)) (fib (- n 2))))))


