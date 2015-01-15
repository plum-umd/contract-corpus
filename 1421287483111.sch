((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (+ 1.0 (- 100 n) (* 2 (/ n 1))))))

#|Result:
#<void>
Possible contract violation: 'f' violates its own contract.
Value contrained by contracts
 (not/c integer?)
 real?
 (=/c (+ …₂ …₁))
violates predicate
 integer?


  

|#
