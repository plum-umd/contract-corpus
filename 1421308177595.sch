((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (if (> n 100)
    (/ 1 (- 100 n))
        2))) )

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 -0.5
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 102))

  

|#
