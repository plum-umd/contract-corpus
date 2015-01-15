((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (/ n 1))))

#|Result:
#<void>
Possible contract violation: 'f' violates its own contract.
Value contrained by contracts
 (not/c integer?)
 (=/c (/ …₁ 1))
 real?
violates predicate
 integer?


  

|#