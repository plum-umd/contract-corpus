((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (+ 1.0 0.0000001 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 101.0
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 0))

  

|#
