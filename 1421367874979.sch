((module m racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . string?)]))
  (define (f x) (x x))))

#|Result:
#<void>
Contract violation: 'm' violates its own contract.
Value
 ((integer? ↦ integer?) ◃ any/c)
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (f any/c))

  
Program is safe

|#
