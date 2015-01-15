((module f racket
  (provide (contract-out [f (-> integer? integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates '/'.
Value
 0
violates predicate
 (≠/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 100))

  
Program is safe

|#
