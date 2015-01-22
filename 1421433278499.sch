(module fib racket
  (define (plus l r)
    (+ l r))
  (provide (contract-out [plus (real? (>/c 0) . -> . real?)]))
  (provide (contract-out [fib ((and/c integer? (>/c 0)) . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        1
        (plus (fib (- n 1)) (fib (- n 2))))))


