((module fib racket
  (provide (contract-out [+ (real? (>/c 0) . -> . real?)]))
  (define (+ l r)
    (/ l r))
  (provide (contract-out [fib (integer? . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        n
        (+ (fib (- n 1)) (fib (- n 2))))))

)

#|Result:
#<void>
Contract violation: 'fib' violates '/'.
Value
 0
violates predicate
 (≠/c 0)


  
Program is safe

|#
