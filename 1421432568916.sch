((module fib racket
  (provide (contract-out [+ (real? (>/c 0) . -> . real?)]))
  (define (+ l r)
    (/ l r))
  (provide (contract-out [fib ((and/c integer? (>/c 0)) . -> . integer?)]))
  (define (fib n)
    (if (>= 2 n)
        n
        (+ (fib (- n 1)) (fib (- n 2))))))

)

#|Result:
#<void>
Possible contract violation: 'fib' violates its own contract.
Value contrained by contracts
 (=/c (/ …₂ …₁))
 (not/c integer?)
 (≠/c 0)
 real?
violates predicate
 integer?


  
Program is safe

|#
