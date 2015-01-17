((module m racket
  (provide (contract-out [f (->i ([x integer?]) [res (x) integer?])]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'm' violates '/'.
Value
 0
violates predicate
 (≠/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." m)) (f 100))

  
Program is safe

|#
