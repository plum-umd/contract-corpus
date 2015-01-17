((module f racket
  (provide (contract-out [f ((and/c integer? (not/c (=/c 100))) . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 -0.5
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 102))

  
Program is safe

|#
