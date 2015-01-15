((module f racket
  (provide (contract-out [f ((>/c 0) . -> . (>/c 0))]))
  (define (f n)
    (+ 1 n)))


)

#|Result:
#<void>
Contract violation: 'f' violates '>'.
Value
 0.863
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 0.863))

  
Program is safe

|#
