((module f racket
  (provide (contract-out [f (integer? . -> . (</c 0))]))
  (define (f n)
    (/ 100 n))))

#|Result:
#<void>
Contract violation: 'f' violates '/'.
Value
 0
violates predicate
 (≠/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 0))

  
Program is safe

|#
