((module f racket
  (provide (contract-out [f ((and/c integer? (</c 100)) . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Possible contract violation: 'f' violates its own contract.
Value contrained by contracts
 (>/c 0)
 (not/c integer?)
 real?
 (≠/c 0)
 (=/c (/ 1 …₁))
violates predicate
 integer?


  
Program is safe

|#
