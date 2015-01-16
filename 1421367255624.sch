((module m racket
  (provide (contract-out [f ((and/c procedure?) . -> . any/c)]))
  (define (f g) (g 5))))

#|Result:
#<void>
Contract violation: 'm' violates a contract in an application.
Value
 any/c
violates predicate
 (arity-includes/c 1)
An example module that breaks it:
 (module user racket (require (submod ".." m)) (f any/c))

  
Program is safe

|#
